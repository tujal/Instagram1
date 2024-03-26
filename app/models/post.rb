class Post < ApplicationRecord
  has_one_attached :image
  has_one_attached :qrcode, dependent: :destroy
  belongs_to :user
  has_many :likes , as: :likable
  has_many :comments, dependent: :destroy
  validates :title, :location, presence: true
  validate :check_image_type
  before_commit :generate_qrcode, on: :create
  def generate_qrcode
    # Get the host
    # host = Rails.application.routes.default_url_options[:host]
    # host = Rails.application.config.action_controller.default_url_options[host: 'http://localhost:3000/', port: 3000 ]
    host ="localhost:3000"
    c = self.user.id
    # Create the QR code object
    # qrcode = RQRCode::QRCode.new("http://#{host}/posts/#{id}")
    qrcode = RQRCode::QRCode.new("http://#{host}/users/#{c}/posts/#{id}")

    # Create a new PNG object
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120,
    )

    # Attach the QR code to the active storage
    self.qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png",
    )
  end

  private
  def check_image_type
      if image.attached?
          if image.content_type == "application/pdf"
              errors.add(:image , "Plz upload jpeg, png, jpg, mp4file ")
          end
      else
          errors.add(:image, "can't be blank")
      end
  end
end
