Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E725B5E
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 02:53:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B3D1C90088
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 00:53:43 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD96DC90084
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 00:53:41 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r10so540445otd.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 17:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DAlQhjzL2sc1aZg4DGOZfz3MVBpHPhzO2m5cd3ADQgU=;
 b=D9LBosrOpCnFSxpMUMrM8ib/kI4vXYhon3ygWWLjTOjpbss2pSEcrWWcFV9y/Kya36
 dxs3zaAsoMYoVBueXaaSWK+GAH87VMAc7MeHH5Ov9gwl1D4XiKY11bfRSeyV6Imu7jlc
 i76JfVt/pHu7GoW57sQFIwvwKLDUJatQ6bi2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAlQhjzL2sc1aZg4DGOZfz3MVBpHPhzO2m5cd3ADQgU=;
 b=Vr+0Ubs79mjAWHZCuGD47OKI4rCy5krlfFbdNQcYUCD4cmvo3Js67UPM3r0cDv99p8
 diNVlpyYlVyR8kM7A/7mvp3cGfTC3tZuR+l9fnO7I1tSIf/11Vm5W5/lgSDyhwOrFFIU
 IxLPbUY/Jpb0qoKAKiNxdvd7JhPETox0oOZFavvA7ZAGukyh7Z2zzmJ75+ZtYZwCMmKU
 bFt0jRN3ORi0K3KBpr4oW4oi6cIq5IU2xcJSkDKWRWqgCgpRwBNhCtTtLTlc2Sf6Axoj
 BkYpTnWhGr0hxX37gZOebetvCZygogWGUhMWgg4HU8ioYAhCTe2KL2jXVFDEyKmcY9xH
 +Rvw==
X-Gm-Message-State: APjAAAVrYBBD2OrXx0zNWc0z+U/V2ujX1Av3TzqeX4R6di6DVubcd5Ay
 uebtkBd39YomTPY5xq/A8LYlMS0RyOHE3tnOu+4LGg==
X-Google-Smtp-Source: APXvYqyzIH3o1YLwBYmB4y0VNs7ahFXyXRMfpO8dLMs8qVYY2gB2ZfHDWdf2BWDUqvddlihiz/N2tGt8ztrZHZdd1oM=
X-Received: by 2002:a9d:400d:: with SMTP id m13mr16684941ote.100.1558486420158; 
 Tue, 21 May 2019 17:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
 <1558459153-14104-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558459153-14104-2-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 May 2019 18:53:28 -0600
Message-ID: <CAPnjgZ3dB52XkkuRx6qvWFekfnZFpb4PL+A68kVAFUMshy9HYQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] test: check u-boot properties in
	SPL device tree
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

On Tue, 21 May 2019 at 11:19, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a test to check the management of the U-boot relocation properties
> for device tree SPL generation (fdtgrep result) and platdata:
> - 'dm-pre-proper' and 'dm-tpl' not included in SPL
> - 'dm-pre-reloc' and 'dm-spl' included in SPL
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3:
> - simplify test after Simon remarks by using fdtgrep on spl dtb
>
> Changes in v2: None
>
>  arch/sandbox/dts/sandbox.dtsi    | 18 ++++++++++++++++++
>  test/py/tests/test_ofplatdata.py | 28 ++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
