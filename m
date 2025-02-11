Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8931A30511
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2025 09:00:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A42CC78034;
	Tue, 11 Feb 2025 08:00:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 238A6C78034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 08:00:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso2694143f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 00:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739260799; x=1739865599;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tc23cMxK3qt1Y74r2oypD56koy7lJxaZP2fLMvJwyCw=;
 b=EEhhZcNao+ceE+he6zOZA7+uvvBdMZdnuuRD8kTIwsJntji0W2TAtLTNVf76oTSkz3
 K9jI06TzYzcUZ5sCRC+uhqqWGnUy1J7zwl/IV6I4hTbaKPoYTBIR8pq6FMuoEjVU/+7e
 m1HHANILVXvjY7GrWqVqR/emOZektS4oU11B3QXMOXD2v7PIcJISYJ51yPzyQhpxUI3C
 S8okPbsOPg7VuSLj3c6fhZHleKPVUrL59wZjB9kLPeRA0Eym4WGy8nT7EyVQ6q/T4sZG
 nFN3s6V8haDAbgrkVh4rh6j9jQLMB9SPgWX43mZqXUw/sHqD0mTtr4Gzzxp4kG96EkF5
 Ne0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739260799; x=1739865599;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tc23cMxK3qt1Y74r2oypD56koy7lJxaZP2fLMvJwyCw=;
 b=faNfaFvrEDnAYaIxkeMAvW0vN6PnVKmM6XOejZNFg8wv0kevZkc5Is41IGV9nSEXgF
 /dfFlWHhmHYZsm+Vqjh4NDeo4Rr6WEZLAsK3lS2tBmeITGh0latmAkWk7bn+FR98PeOD
 DxpwBNyk0FmfkSGAzxbEYZ4Z6eqd/NFZ2Da0kspI7kKQ7kgOZFjYnttmjwcY4fC8xljp
 yw+sv+9mlUiGQNEb1PcXJ7ZJqXuQ5pmFsq2mm5JU6SzGbkTXmHvXOJx2XsLQpI9v8vvO
 yUWAMOurmcZv+E6lmpneMMXHQ6FB0YeQWMQx5QjNPIeTN9z5k9s9sqbI8o42Zyy4d/5+
 JEfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWWcJuSUdDUeQ4/MkyaB5OHIh6YkDq5XXSIAZaATeyXAt/2EVBsBfrJ9v/LKXBUukBZWNHwltdXE6rAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxlcGA58urC59//9HL6FD39TRuDuuJt+6N8z71cOox2kUoVjmOJ
 YLAXhiFJnM8N+vNSpvv07nUpvKHt7RI0PzPrpen0YnomvFv9nc1AoAJq3JLvM8M=
X-Gm-Gg: ASbGnctf28Cy8Ai+4tBLw1QApDJuFOpEwoIKE1zr71/ZhwPYWy3OzwIHzf8mQO6sZbA
 mtzOEsKl2JSI+a5RViE1TF51G9Ntb3AdfttMKInmEB5iyEXGTatqfVD/mVvlBencGuQpfvMrMXv
 leHTMkJggPEAGy8MChpaoEYT+7O5pZwSsPe4nrtibtK9mWvldCcwAfUsEmiUQO+HCWtzm2fvz9b
 AxWY+bRlps8WG7VisHzyrxdNYrkiXQEyDrWzkU7jYUjFCHpl9I0rRCjL+NT1mILyMFfLlr8Qs9H
 ewBDCZ30K/sHDMKGl7WvbMKGW5wbDKM=
X-Google-Smtp-Source: AGHT+IEVEXV5vqhSVaAynjhGisENcs+pJd0MftrnzEGt7Bn2wKLLOSPbcKBLd7TeXaFsnyjdPPUWXA==
X-Received: by 2002:a5d:5885:0:b0:38d:e3e2:27c9 with SMTP id
 ffacd0b85a97d-38de3e229damr2706886f8f.8.1739260799506; 
 Mon, 10 Feb 2025 23:59:59 -0800 (PST)
Received: from [192.168.1.20] ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd2ef7efesm9197090f8f.52.2025.02.10.23.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 23:59:58 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20241202074644.5380-1-patrice.chotard@foss.st.com>
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
Message-Id: <173926079853.169372.11937323976344115519.b4-ty@baylibre.com>
Date: Tue, 11 Feb 2025 08:59:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3-dev-86319
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On Mon, 02 Dec 2024 08:46:44 +0100, Patrice Chotard wrote:
> In case "ums" command is used on platforms which don't implement
> g_dnl_board_usb_cable_connected() and USB cable is not connected,
> we stay inside sleep_thread() forever and watchdog is triggered.
> 
> Add schedule() call to avoid this issue.
> 
> 
> [...]

Thanks, Applied to https://source.denx.de/u-boot/custodians/u-boot-dfu (u-boot-dfu)

[1/1] usb: gadget: f_mass_storage: Add schedule() in sleep_thread()
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/4b6a3e860878de5198f5561a0d8c602a9c296f0a

--
Mattijs
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
