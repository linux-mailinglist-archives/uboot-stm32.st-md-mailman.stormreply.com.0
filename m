Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A51599B80B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2024 17:58:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F00DC78035;
	Thu, 31 Oct 2024 16:58:44 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0CEBC78035
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 16:58:37 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5ede515c08aso158356eaf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1730393916; x=1730998716;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7l8N0sUCSr10g61egT2VwdCFmFftywa6XByayvQaXE=;
 b=Tur/AHZxwp762/mlpqMgh2DBu9rc6cIGT05V7T2M12RnvMpHq3P7n4HvBtR2vQmUVZ
 oiWJA7WfTV4k1EopQDD6oeM+n5ioQX5cQa/Ct8wL0kmz5kc/IloC8N+1phBULlslzW5m
 KHCj/tRBruHYepKfP4UCwdtuVefSM87SVk878=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730393916; x=1730998716;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7l8N0sUCSr10g61egT2VwdCFmFftywa6XByayvQaXE=;
 b=sx0ccjgGNlZyQFhCOR17wEuF/CK+qgZJPSYTtb7hneQIvVG5mVHm3WqFoQFdWejLCi
 k75XrJMoVJfHXQxHBxz47vLYHEbLXOraMxCrwVtjaifQgpNRYF9Z4rqsUPf0FF0A4vDp
 E7G0Z9zXjHvQIYQPZ2/oMhd47VCd8VkW+OAQoZImkRQn+/QI5JFMDoYleD69a3U8VQM+
 t4K3Vrkcfdy1AH5DZqTQyRuWCCJhDwsPfSjR4aLZdYnm2ySuUNWXiRnVlubDee8LbZ/p
 unfHQyxBhwx/lKDal0asXNzVQQLwYgq4mJwV2ZxE5AjcoTjO+UD18ak4a7gX/Nz2CKRK
 KzGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU09GYgri2RBKprHXaygHXmDCjVnuulOYRLrM1o0KPMAhrWNUEOGdfl2Kk/HhmAzr7D/XRC7HRKRGQsfA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUlQjBToYjLf71ioCrLa5BnvhR0AtY+iJH8ddYfF2DsoVUIyyO
 /dZbqzrzGjG583AnHM+rdTTCM4x5agx/xt0QAGthpSKdbAM7bl8cSpbIAPlOHXc=
X-Google-Smtp-Source: AGHT+IHrAbDkPP+2aGp2SgmnAo7vMAkjdFgKLLoX060cse+1PnAdRJ7leaxaStnT0xzvzQvP/Fgicg==
X-Received: by 2002:a05:6359:5102:b0:1c3:89d4:e888 with SMTP id
 e5c5f4694b2df-1c5f9a01d87mr59948755d.20.1730393916455; 
 Thu, 31 Oct 2024 09:58:36 -0700 (PDT)
Received: from [127.0.1.1] ([187.144.104.2]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ad0c7009sm9350821cf.43.2024.10.31.09.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:58:35 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
Message-Id: <173039391434.3581308.11011380626355124787.b4-ty@konsulko.com>
Date: Thu, 31 Oct 2024 10:58:34 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

On Sat, 26 Oct 2024 22:16:18 +0200, Marek Vasut wrote:

> Remove undocumented nor->addr_width == 3 test. This was added in commit
> 5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories support")
> without any explanation in the commit message. Remove it.
> 
> This also has a bad side-effect which breaks READ operation of every SPI NOR
> which does not use addr_width == 3, e.g. s25fs512s does not work at all. This
> is because if addr_width != 3, rem_bank_len is always 0, and if rem_bank_len
> is 0, then read_len is 0 and if read_len is 0, then the spi_nor_read() returns
> -EIO.
> 
> [...]

Applied to u-boot/master, thanks!

-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
