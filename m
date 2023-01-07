Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F71660AAE
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:15:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B78F0C69069;
	Sat,  7 Jan 2023 00:15:00 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 215C3C69069
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:59 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 194so1262849ybf.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9nlcr1MaP75MRPGOTCNBS5WKL1SI8NFsmRCC6xIZOnY=;
 b=KZZD3fsLugLnPm/mh8lCdxfHbtduOCW1NKpUtwRyhYHnTLRG2BG1BMAIUBYyo9vATR
 DOHWwQ9gPYgIT1lDI0QGjtrlBF1xj/mqACC1O+hWSZR3thJcuG3fo8isLFNshapc6Ru/
 p+dvsQfxXnfJn3VN8QNT8mlLFi75/YMuseom0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9nlcr1MaP75MRPGOTCNBS5WKL1SI8NFsmRCC6xIZOnY=;
 b=jPyPPcV9qHzMs1dEHaTfDp+tQCTsGs7cRrYuPxL7SGbRJRR0iCh/hv8auhSkp3pr3e
 6NKdbPsGvb5P4PL+bDwcuJ3OavL7hSrJ0nTRnPNAqzjDtsLh5TyhIGDq7kwldWgC1vGb
 2p4Plyfjy2dC1MC+2BN3Kxfg/L6+Nb9VAFbJswpuLmKxUXclbfjHSsDiY+Xhxs0TJx/g
 Gc+PtFXuJlGz6D6cIeXpE5ResW2u1iajQ+2e/ez6TdGTlKK5qCCMmW9skvanSvgMmBJb
 bquZdWMORt8KlDXnljOLk2x//jQUhnsMCgpW314VjxJAJdpRa3QiU4qheX647hGEHo8f
 L0Tw==
X-Gm-Message-State: AFqh2kp5ctLoITjmz58p3BE2ZcMsWE4SWiJkohaG2NT9ukR/kXk+20ob
 PSTbSnJk+osLyzdP0pGAFhyeLTc57p7dNBvW/kbVjQ==
X-Google-Smtp-Source: AMrXdXtAytsxvZGisHTqgdh/uUgrgI5mWDZ6RzKTemDCyGYXUKPbQyeUxXKubmDjAzLAed52xl518fxUomgy1ynkqwk=
X-Received: by 2002:a25:258:0:b0:7ab:1c67:8c7 with SMTP id
 85-20020a250258000000b007ab1c6708c7mr1446437ybc.50.1673050497821; 
 Fri, 06 Jan 2023 16:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-5-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-5-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:33 -0700
Message-ID: <CAPnjgZ3Gd3AZyUPi_9BzWmZUYhizipXgjeg9qU1MjnJ8aiVUXA@mail.gmail.com>
To: Alexander Graf <agraf@csgraf.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 4/9] video: Add damage notification on
	bmp display
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

On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
>
> Let's report the video damage when we draw a bitmap on the screen. This
> way we can later lazily flush only relevant regions to hardware.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
> ---
>  drivers/video/video_bmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
