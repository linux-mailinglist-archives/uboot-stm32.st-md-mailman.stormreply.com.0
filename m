Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FE6A9834E
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Apr 2025 10:29:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 432EEC7128A;
	Wed, 23 Apr 2025 08:29:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D67DC69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 08:29:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54d65cb6e8aso7254589e87.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 01:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745396967; x=1746001767;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86Tp9HDGpQ6Qip75ZShju/ejL1p8J736aXBEEMWZSdY=;
 b=r33k2BvH80lyLuTaOzvceeX6bCReQ1xd9e2zZxaab9FHpkdHk4UCHIpLCUNwEYARBU
 d/lpVMX1kZEcONtOVxSd6uYYI+1TIKmX9dLLaiCxG0eamF5uHPvn23swSZTsaENZzsWD
 pH1Usx8Ax437BMJwcYoZSJATe2Ut1tjcPUcYjBRNGMXbCD/sxBtkg7cGkWBiqFTQp4Gf
 O0znSsuZPRXUhOe1IAqwf2vnoCySelzRViIsJCjIeVwabV3cG/gpFMwp64HW4kH89kMp
 jVYXhMOU/95ceXg1DWk+tiNy0Bfz+jklL3cnUOt4eRHF7aJaEeBcUkA/w3IdUVs17Dka
 btlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745396967; x=1746001767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86Tp9HDGpQ6Qip75ZShju/ejL1p8J736aXBEEMWZSdY=;
 b=mxjzAQ+22mlb7RqRGhPUEYexIdhnftgKUr+PT58XOwsvunI/LllrqVGdPR6za7kRr1
 Ez+tox36GOzOC4DxpLFkRMqpsX5bbTaujWCZd9/u8Fa02wpE4AVuPhxnUE/O2bDZw5MH
 M0VcGVCyFg1jfzoYZ3Tkx+8WMuS+4QmX9JZlH9fq2iphgXAARHajqEefkVoGXTb/mip/
 dwnmGIP6Ut0JtYSbP/8YF0hlHvcHB7hISrcQ3OoXK/lAs+Uw08Wqs59I6MrkwLhfd0aV
 l47vi3aQL2S+Bqo2G4V/WgPmae/KdsRegYaXh0KgdY4ZtrJivHMyw3ILliOdppHIaVHA
 okcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3hMKYU4nbqw9aw1IFAlnCKjSebBQOZ9vPMd6AGdKhpegjXWx4NPzUuhfoKFo9PllF5Q/ru4CxZ+U6EQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrNK4/WwUZGabRAMxL1hVrH1+VpEliMEOgGeYND4TiomMQHzNy
 OfZWcJh0kAFXtC3yQ4yFpHPg8iT3alAsAw5dzzTBj6Apgw6272cmuFGT4kuhjzMDnycGkQB0NFS
 VecW0J9BJHk5YiJd2aoSP/tn2fxVEKXVPgSkElg==
X-Gm-Gg: ASbGncuYo2NtVmNd5g/7+Wg0jzWDDE5uKb/DRfqAx9eIJXJheQ132c5m1vmhRFaoWoU
 YirvEhs0FcNRODPbhAH2afOJiqxnmM6XXMyNZxx3fUE2ZHQQhkWc5iLCI0IW8FvgZov7KaiktSi
 ZO+5pMEvMegMvWdBqjjZj7ZQ==
X-Google-Smtp-Source: AGHT+IHWkooQn8ZHHQpbjQ5KfSGh14xpiPKiV9QQfwKQBUboGW/7rhBWyE/COaowaCGv/y/DELyg6+iknL8+B82XQbU=
X-Received: by 2002:a05:6512:4022:b0:549:6759:3982 with SMTP id
 2adb3069b0e04-54d6e658f33mr5624841e87.37.1745396967369; Wed, 23 Apr 2025
 01:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250422131229.415020-1-patrice.chotard@foss.st.com>
In-Reply-To: <20250422131229.415020-1-patrice.chotard@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:29:16 +0200
X-Gm-Features: ATxdqUGL3n04T9zIzfkeS3zXpw2W5UyPXwQNVDlJl4EYzFfqqUxDugUTjuR1DHU
Message-ID: <CACRpkdZY946nqABY+4hdWJvK8gJrs-ra_iVYp-uVnMBUQvSm3A@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Fabio Estevam <festevam@denx.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Bernhard Messerklinger <bernhard.messerklinger@br-automation.com>,
 Michal Simek <michal.simek@amd.com>, Lukasz Majewski <lukma@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Simon Glass <sjg@chromium.org>, Prasad Kummari <prasad.kummari@amd.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/13] Enable OF_UPSTREAM for STM32 and
	STi platforms
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgMzoxNuKAr1BNIFBhdHJpY2UgQ2hvdGFyZAo8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gVGhpcyBzZXJpZXMgaXMgZW5hYmxpbmcg
T0ZfVVBTVFJFQU0gZmxhZyBmb3IgU1RNMzIgTUNVJ3MsIE1QVSdzIGFuZAo+IFNUaSBwbGF0Zm9y
bXMuCj4gRm9yIHNvbWUgYm9hcmRzLCBzb21lIGRlZmNvbmZpZyBhbmQgRFQgdXBkYXRlIGFyZSBu
ZWVkZWQgdG8ga2VlcCB0aGUKPiBzYW1lIGZ1bmN0aW9uYWwgbGV2ZWwuCj4KPiBUaGUgbWFqb3Ig
aW1wYWN0IGNvbmNlcm5zIE1QVSdzIHBsYXRmb3JtIHdpdGggaW50cm9kdWN0aW9uIG9mIFNUTTMy
Cj4gU3lzdGVtIEJ1cy4KCkV4Y2VsbGVudCB3b3JrIGFzIGFsd2F5cyBQYXRyaWNlLApSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
