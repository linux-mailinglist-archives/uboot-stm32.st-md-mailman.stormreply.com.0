Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0995A3256B6
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 20:31:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD2DC57B58;
	Thu, 25 Feb 2021 19:31:58 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71A57C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 19:31:57 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id s3so6826979otg.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 11:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tr7aLauAa0XY+ZlItf+ZiiAX37Ta9H+GiFsWMRg/N7E=;
 b=CxxuAAP2oDl8aefQYVlVjQOoUwKHrwG4SDvP15pxrpaxieQXcNkhtOxNLD5mAXwGyE
 cC9qFSD8hc7K/oaRQS2VKXLb7MYXGUQgmNVwXK0nPox7M0BKIZ9EK+5zJKY29l2j9fMS
 mgHSbKF71M+brEzb37AY1chfmKHbWeIG3RnvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tr7aLauAa0XY+ZlItf+ZiiAX37Ta9H+GiFsWMRg/N7E=;
 b=Dp+cTQbn9phrglUAtRogTOuHggOQijd09/3fV+zS39vv3aEC9rfJ8C2rSAI+iJWfX8
 /gmay4NPaQzvQHC85taL/ZBzt+zSBGGg1mrFWVBkoGyrKMdhZ+ctJVqvjijQq0+UwggQ
 +ly2oJEzx+ybSCPxGPFK4+BrVtauG8Ddygdk41C6MV17ujdNmgaz27qdo7NSNRr4fMxd
 NNjmO+zhRevGlzcNONYb21j2j1N8cJuGqUpvS17+qxJlcTUfGPOXWTAgEdkwEU+4x+fE
 VFKlGBwqdYCPNgi3HcCUiwCAUVHCXrDRjT1eEFPNTcCRRXpDcgEdkqW5zrfPgjeTdqnj
 oKtA==
X-Gm-Message-State: AOAM530k3ZCsqqbKJ9csXq7EAAmy6Y06gG5zKuSfu5YUYXNiu+wC6Lu0
 Jl/4EYDJxmf9k9iY3tUgYOp/xvC8EfCWzlf6E5YpiA==
X-Google-Smtp-Source: ABdhPJzTKImLnMjI7xiFdqiw0k2l/bG3QdfTAEMdi6FWCYNn0SW6GHWY+fdcQQt4ij9lrxPcMgMILWEoglGuC5Cea6s=
X-Received: by 2002:a05:6830:314a:: with SMTP id
 c10mr3581060ots.54.1614281515799; 
 Thu, 25 Feb 2021 11:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.4.I390560c87a294deb05e06e1ad92e02fb736ba9a0@changeid>
In-Reply-To: <20210224111907.4.I390560c87a294deb05e06e1ad92e02fb736ba9a0@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 25 Feb 2021 14:31:36 -0500
Message-ID: <CAPnjgZ0tsi6_ooMkErpaxGzHB2mdE09g2Q0x=iEzxuPHfEP=iA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 4/6] scmi: define LOG_CATEGORY
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

On Wed, 24 Feb 2021 at 05:20, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Define LOG_CATEGORY to allow filtering with log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/firmware/scmi/mailbox_agent.c        | 2 ++
>  drivers/firmware/scmi/sandbox-scmi_agent.c   | 2 ++
>  drivers/firmware/scmi/sandbox-scmi_devices.c | 2 ++
>  drivers/firmware/scmi/scmi_agent-uclass.c    | 2 ++
>  drivers/firmware/scmi/smccc_agent.c          | 2 ++
>  drivers/firmware/scmi/smt.c                  | 2 ++
>  6 files changed, 12 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
