Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9795FA30519
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2025 09:02:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EE68C78034;
	Tue, 11 Feb 2025 08:02:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56B69C6C83D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 08:02:09 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38dc9eba8a1so3237968f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 00:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739260929; x=1739865729;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w0WHl9br8SOJxDiuFZPC4zGWiGcF/8o7g/+2DpMJhvI=;
 b=OjO84dLd0oCWG7dlSz05sBNVAmOfl9m4r15ZXglOGvi8Sgyg0BeOAmj2iipFLPsidD
 BhMzipFXwQO1BVkoEzBXdXxkxR4VFOanVCqXUF/St4OuTUST7JfuOu36n5ImL0YedHjU
 BgRFk4PerrdNpgP/uyCtOy1T3EanRQ/8OjnBrV+sBi3NGiKo/yG+g3U8fLjlepha+mU7
 SFnbvGOoj5bybp+SkFtirwd+me2hIMEigiANEtLCpSS0jQ14O+Xqcr4eGm1T5yuAOP63
 lvDwDFXq7PmIyLglMCJa0a3NSerhR5FXuiwXCT7tC3k1qpfXFnrvC6/FpL8BXTdSo1N3
 JDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739260929; x=1739865729;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w0WHl9br8SOJxDiuFZPC4zGWiGcF/8o7g/+2DpMJhvI=;
 b=Lmtb0p+/iBGeIH9V6ZZtVMwrxENBbjL04nESqLUSNPDrESml86M13xe8brBOsD7MXu
 GOxBKVYDJC/1Cv5kFBn+0JyoM0ZAfqnHzX2gTnyG6xi+yAegx7wf19CK7n3SzBfE5+dB
 l90iMemu6Q3tEVXBgZELFLi9yK2geBr323Y4geIj1I0MhUBdClPp1Ba4Y/Fd5xjrzoXN
 4JjgvF5e+fu47ejx6SPGp+NKcK7qQu1ZuNv2AzVZ4tnk+YFg0SIUssFj48xjMYXxjCbd
 KAiV6fS2w69SHDJO1Xkg+GkC1GjZGG0YpNBf1P+wckGd9TKY2IuUuKs33Om+tMaIGUwb
 hfkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/YsalXqA2OPteUQp2tMNtpPqmjUT1X9ZzVjPq8l4vNDwZFSVlPvDSS7ax+S0kpjdMYEb8ToCYdnAStQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4VDlb0oECj0CIY419LsnEXts9xkdIQwDNMfbts+Q4TsQJWUki
 zu33+s+HKx4IAuGECWG1+dnoBhlr57wzy+ksZP+Gi4sHo3v7PP9EfEjpMsMP290=
X-Gm-Gg: ASbGncuRol3bVfotAFyDSk/uu1RVgMsJ/ynJpmfEws8hZzV2lfC+KmbdwqGYaTMj1F8
 U2T0xLPTRWb9fJntTwcN7cRIRGJMxD5OHcaaoPlK5D8AHU5hyuQAt68deNn8ft7k0Lmz3BnybtQ
 NbzsUOFwuj80loSEEgAo1ZHntGoSkGcI/34xHACCVZA5CWT8WiOrS0x0AbnnG66Zib1HwlG7dBw
 5L5zEiuWTeB6mrFSoRfkkk+ZuWtiNNT23t8mXAjF6rK6xB9x9+YwPi9PuK2eriMQSAnMLbFPOxe
 L/88ibQ4uGNYnP9ikjdsIJ/GEqj+O94=
X-Google-Smtp-Source: AGHT+IFY00R9GgLXfV8ym9GIt98Vh5wf3oLlsYf9DJiaKombPnQOiWDbvtxAPPqk2nEKa1xi7yrWag==
X-Received: by 2002:a5d:47c3:0:b0:38d:e166:8dc2 with SMTP id
 ffacd0b85a97d-38de1669178mr5426586f8f.16.1739260928717; 
 Tue, 11 Feb 2025 00:02:08 -0800 (PST)
Received: from [192.168.1.20] ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd44c5e3dsm8738543f8f.62.2025.02.11.00.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 00:02:08 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250130163547.512990-1-patrice.chotard@foss.st.com>
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
Message-Id: <173926092753.170899.3777057855491672069.b4-ty@baylibre.com>
Date: Tue, 11 Feb 2025 09:02:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3-dev-86319
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Mathieu Othacehe <othacehe@gnu.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [Uboot-stm32] [PATCH v5 0/9] Restore USB and add UMS support
 for STiH407-B2260
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

On Thu, 30 Jan 2025 17:35:38 +0100, Patrice Chotard wrote:
> This series is :
>  _ restoring USB on STiH410-B2260 which hasn't been
>    tested since a while.
>  _ migrating STi DWC3 glue from proprietary driver to
>    dwc3-generic driver.
>  _ adding UMS support for STiH410-B2260.
> 
> [...]

Thanks, Applied to https://source.denx.de/u-boot/custodians/u-boot-dfu (u-boot-dfu)

[1/9] ARM: dts: sti: Add fixed clock for ehci and ohci nodes in stih410-b2260.dtsi
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/3810cd52cbf42727ebe22cf2a7929045d5ab01fd
[2/9] configs: stih410-b2260: Enable DM_REGULATOR flag
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/0f688eb0d69e2f8f65532908d8575113b4bd3427
[3/9] usb: dwc3: Remove dwc3 glue driver support for STi
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/15cd35cb3f1a128f1f4da8a3e5b8d93316125330
[4/9] usb: dwc3-generic: Reorder include
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/9de4b7e0a4c93128f28b19ad8a3a82421275418f
[5/9] usb: dwc3-generic: Add STih407 support
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/23542078ec9a49cfb35cc00a6715106afbf65627
[6/9] configs: stih410-b2260: Enable USB_DWC3_GENERIC and USB_DWC3_STI flags
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/08fec26a67643fac05e2a076d19c54bca6f6e427
[7/9] configs: stih410-b2260: Enable DM_USB_GADGET flag
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/d0ff527f6237a78fb289b02e5dab63a23478565b
[8/9] board: stih410-b2260: Remove board_usb_init/cleanup()
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/0b96214cb32ebc54e92442a96eb9dc1e1f7e9175
[9/9] configs: stih410-b2260: Enable CMD_USB_MASS_STORAGE flag
      https://source.denx.de/u-boot/custodians/u-boot-dfu/-/commit/4096d28ec80f982454ef0dc7d42a4d4eaead5d56

--
Mattijs
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
