Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A77830DD
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC11C6B47F;
	Mon, 21 Aug 2023 19:13:42 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 050C1C6B44E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:40 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-d665467e134so3866827276.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+QxzdAGUkhRPKHpFg4eIRrv6KWKZvae7lBIKLUMW37E=;
 b=BLfj27KMh7vIHMzzN7YsRK/jnkMXAb82ng9KBI/b8oyXibSiwtXvQDU1FIbVzDWeW5
 WO3+MBX0VADUM8FEDRgVSUDP0QBhHphHMOdV0eXBa05HD88WNKeF35fPB8TMwAYuLdoT
 GoM2RWg64dOUdpbs40Aet+etvQ39dr0d4gpwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+QxzdAGUkhRPKHpFg4eIRrv6KWKZvae7lBIKLUMW37E=;
 b=LxoDe8otPqa631OaPMfUu4Xei/r7B4lAzkfIwpyKvS8tLY8uMeqbhXf990Ox1JXkUT
 QF5z1RXfmSzPFtgdRIKW0CvJbw1EUIqUNu4R+hd8nuQ10UlDv7eufKsFO2X9q80pKGXQ
 lkkIIsdyd6cZ7Dt/Rpum6m8IkGBPbjSUR5kUlithtYWeD/nMinP6nd6aMDqihOQ5SwdE
 8cnggLM2wl+DTRj9GymKm+TKdHIV6ITLXlwanOZ8U/BTotKh7AyVtZVNnZPBDYlshufm
 fCwibggfDi+movfkDf7mmJACfaVTGhutT02hiJjUnjPQqj1Nlc/SPVGQzThH/NfuMPBe
 r30Q==
X-Gm-Message-State: AOJu0YzUW21GSficsWeJgN2hYOjDAqIR9b5R2BVKi0AzWr/LIZSUeP/G
 i6+oHCsRRi7+fUUORDvVsQi2cILnFmYB/0N3rfIMGw==
X-Google-Smtp-Source: AGHT+IEKpUcrWeRlNWq23CqQKX95HNTYrG6zoQ+0vOxYYtXVY7N3MC0hq4zcxixhk0WFae5x+hJ88qQD5h4C5qVMpho=
X-Received: by 2002:a5b:d45:0:b0:cb9:41ad:8938 with SMTP id
 f5-20020a5b0d45000000b00cb941ad8938mr7139743ybr.3.1692645218734; Mon, 21 Aug
 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-6-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-6-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:49 -0600
Message-ID: <CAPnjgZ3NpWp479MQk8edxH3eGnM50sJaS4+P46ZCpL+Ev_LcUg@mail.gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 05/13] dm: video: Add damage
	notification on display fills
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

On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> From: Alexander Graf <agraf@csgraf.de>
>
> Let's report the video damage when we fill parts of the screen. This
> way we can later lazily flush only relevant regions to hardware.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
> [Alper: Call video_damage() in video_fill_part(), edit commit message]
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
> Does video_fill_part() need a video_sync(dev, false) here?
>
> Changes in v5:
> - Call video_damage() also in video_fill_part()
>
>  drivers/video/video-uclass.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
