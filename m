Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5841723C3A
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 17:35:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47179C5EC40
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:35:57 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BFD6C5E2DD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:35:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 66so13419163otq.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rfFLJ9U5k/s8Zyqow2k1iIvlqTsOq/R733UcdIbaPTM=;
 b=fs8OgxC4jawdywzeNxt5ug64HQax62VGYFO5faq1w9bQU+YD+YV3HGoA237pz9Rr7g
 j1oJqQ+QTJCq+SE/ux1Zh7cdd4YpPjkH9ABacVtwplCgUoVTzwfi8EcBd522quvXN1G4
 vyq1BK7I7txeiuoziB1rGT/0C6pW6uwkgdtus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfFLJ9U5k/s8Zyqow2k1iIvlqTsOq/R733UcdIbaPTM=;
 b=i2tjUtnXvlDDAwKfNqTPLvTtnM/43AyZqPUh05UOKPlA7junxgMYN42pOsQdN9ztPs
 O0Qx6tVgCYlDY4Bl9EBXQpG9gyoLMbrdJzPGi0gHl4Ty2wFlj+NGmEGSL3n1/RHhMp37
 CBFqOYKb1QPISDtg6vafaRBIJvbLG/Dxi6T612sMWicXEAHmsl7aJ4HviRln5OmPhdOy
 bO0da2UCaupHP+l2/Z1AYBYZADp2Z+84fwhksdHqAWFIGAEPYIDPCfQ+S+qZgomo3TLF
 jKUWOhC7jWmTKWJCZCeco70N4odnA8elVphqt4s8S2qPQcDW5znLZT+XybDntATPPXVu
 eHUg==
X-Gm-Message-State: APjAAAWPyyX02TuobfbbOCTNFMa6RFMFIX6jMwocizSNhxBeQz+jDsro
 Fg48vcEz5Mg88wEua1UmGV3xcTaulHWcgRbmBNcPbQ==
X-Google-Smtp-Source: APXvYqxdXu1uEuo2xYjH6CounRLf70m/0BIr6qXziAszWkinpikFNsCJXhuu1JSjhgxl+8rqFUvJw88QXcPN8Zq4oso=
X-Received: by 2002:a9d:30d6:: with SMTP id r22mr45395793otg.33.1558366553470; 
 Mon, 20 May 2019 08:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558357207-7345-2-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 May 2019 09:35:39 -0600
Message-ID: <CAPnjgZ3L+Dzv+cW1xHcJnu=Kv01i0AT8ZNwbL9JHePtwksoNyw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v2 1/8] sandbox: add config for SPL boot
	with devicetree
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

Hi Patrick,

On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Creates defconfig sandbox_spl_dtb_defconfig, same than
> sandbox_spl_defconfig but without CONFIG_SPL_OF_PLATDATA;
> to allow SPL compilation:
> - OF_HOSTFILE is changed to OF_EMBED.

What is this for? Each patch should have a motivation.

Is there are cover-letter for this series?

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - add sandbox_spl_dtb_defconfig for test
>
>  board/sandbox/MAINTAINERS         |   1 +
>  configs/sandbox_spl_dtb_defconfig | 199 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100644 configs/sandbox_spl_dtb_defconfig

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
