Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D2660AA4
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:13:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B437C69066;
	Sat,  7 Jan 2023 00:13:49 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 698C0C69062
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:13:47 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id fc4so6951713ejc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0lpSg6EMmTZvLheMvEeU4/lANzpxRiekO0KSW4dQmRs=;
 b=lL6q8+Kuva74IvjDXKpVAAL83+h/DxXsZBhzO+rz+sVdV1ZBY5Bhcf3jU/+gXysHNc
 CdOOD+fDuAW6qN02sTQeLL64KfkgbAz8M8bw+jB4Y3TQh5TeB5sDyEhdyTafPfCFvyN6
 9YfU6t8YxpJo8RLH8xCDAfqITXvE17lEteKSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0lpSg6EMmTZvLheMvEeU4/lANzpxRiekO0KSW4dQmRs=;
 b=YWuDitLnv4LgjX4D0+ieIisnyZ7VwG9n17L/ne9yfWl1FLRXaELkQ8cAtKo+wKzDJH
 OU/Zgcl3vD0bMjWOEKNlAxBYxJ7RiKXXSITb/A5xK1GTVJqy0GNLHQj7ENGLwuypZntN
 OM7hU16kI91GGRs5x5cElNulEESNiblF3temGfslnfVDqVVOKAIVopQLbRStypfrmWMw
 tmPKijVZeQkUffbRhcr2JwqQGt6JTjjAnJpmCRa+3nBQnsSbaM90Meuye8IMY77BjPtT
 KWZ0LYSEd+BQrwPPirgCU+VZceB12qaCW5Y+G5vDfKZF5+3RooW0a4dWWgYBFDST6yMC
 2AvQ==
X-Gm-Message-State: AFqh2kpDeDm2nAlyGs1A0xuRibWyOF1uspdPiDKSCh6yvN9VaMbc9/Tu
 CAMNSpNf8gVqUpbAkh59n3IXEY6k+v8RuiZf8DC5GQ==
X-Google-Smtp-Source: AMrXdXsk5mbyKyyVOtt7+NZkzR098F8mWem1+daAftbg4zfN5vHG2y3nt14lsw5iviaL8bjw5yQ6OlgEWmzlBslqtRE=
X-Received: by 2002:a17:906:c291:b0:84d:cc3:fd78 with SMTP id
 r17-20020a170906c29100b0084d0cc3fd78mr994886ejz.745.1673050426685; Fri, 06
 Jan 2023 16:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-3-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-3-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:31 -0700
Message-ID: <CAPnjgZ0Ca3yJSWs6fj8eh+-M=KHtRuLtia-hCXBEKX58EZVY0w@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v4 2/9] dm: video: Add damage notification
	on display clear
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
> Let's report the video damage when we clear the screen. This
> way we can later lazily flush only relevant regions to hardware.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
> ---
>  drivers/video/video-uclass.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
