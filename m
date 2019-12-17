Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B481122C4B
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Dec 2019 13:52:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E872BC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Dec 2019 12:52:09 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB6EFC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 12:52:08 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id b12so2146950ybg.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=jpU6a8RMTHNKMoUvlOH0fYCXlCkjpvjrgNgGhI8qlTY=;
 b=reCbMbzrPSfi3VRXh5pSMg6aeApN40P2ud9XuPIT7zcQpYYUOwl+7mh6CYQk8KVx77
 L4a/rzyNt/WCFush4v6XmYwJ0FUoLMirScyRJ/ntmvjncGt9/7Tz6TgyRozudwM3kF+A
 e8pB9yImhk53M8oYAJIvP7316RueMZnpXDsbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jpU6a8RMTHNKMoUvlOH0fYCXlCkjpvjrgNgGhI8qlTY=;
 b=YAU2NSnIPp+v2RU4CNQKv9mufMf9K00WndjAP3hGqvyiOLN6/ll7f/oCgz96TA1YfN
 s8jOIE+dYzVU7JdL36qcrw7VNvjCsqx+k4+jFKQTz8NNT0IiEdVjVquV5Bj91K0TxPOJ
 HJ+b58yt783uMadT3d4V/s14zLGpRVNAltVv/IQzp0OKUDhEkDhtD+w9bbXT6XL2/WlA
 hc57okWuYfqWsz4ZRn4y70v94Way5nVYJ4IpOd9Q41K8yNn8hPZYVOlypypHK4T5VE6l
 R+iOadjzazsvFpMcOz+/cUAFc+0JKAto+SfrIEBvkf1laj1ge8JD5WWPkRDICfCAqyPg
 qLNQ==
X-Gm-Message-State: APjAAAV5saWfbu4Rs3pblSMYj+rH5dfFOx9vIo7H7p4yIYQ8Gs5nLdxZ
 aB2gr80QA/Du13ztq0mEsuuVkQ==
X-Google-Smtp-Source: APXvYqzSF9BxleaxIsEQJKS+NIbXSn5oiDL5ojTmEeDUQkb2SECOlIvKpfD3FD5PDHoZJb6BiIfTbA==
X-Received: by 2002:a25:26d0:: with SMTP id m199mr16493131ybm.38.1576587127298; 
 Tue, 17 Dec 2019 04:52:07 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-b1f8-850d-9a2e-1e49.inf6.spectrum.com.
 [2606:a000:1401:86dd:b1f8:850d:9a2e:1e49])
 by smtp.gmail.com with ESMTPSA id e63sm9734484ywd.64.2019.12.17.04.52.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Dec 2019 04:52:06 -0800 (PST)
Date: Tue, 17 Dec 2019 07:52:04 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20191217125204.GA12668@bill-the-cat>
References: <20191127091138.29223-1-patrice.chotard@st.com>
 <611198b18f8e404d9c63a3ab2a1410dd@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <611198b18f8e404d9c63a3ab2a1410dd@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stephen Warren <swarren@nvidia.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure gd->new_bootstage
	alignment
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

On Mon, Dec 16, 2019 at 11:53:48AM +0000, Patrick DELAUNAY wrote:
> Hi Tom,
> 
> > From: Patrice CHOTARD <patrice.chotard@st.com>
> > Sent: mercredi 27 novembre 2019 10:12
> > 
> > In reserve_bootstage(), in case size is odd, gd->new_bootstage is not aligned. In
> > bootstage_relocate(), the platform hangs when getting access to data-
> > >record[i].name.
> > To avoid this issue, make gd->new_bootstage 16 byte aligned.
> > 
> > To insure that new_bootstage is 16 byte aligned (at least needed for
> > x86_64 and ARMv8) and new_bootstage starts down to get enough space,
> > ALIGN_DOWN macro is used.
> > 
> > Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
> > 
> > Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> > Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> > Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> > Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> > 
> 
> Do you plan to merge this fixe for the next rc for v2020.01 ?
> Or do you expect some change / review.
>
> This patch is mandatory for stm32mp1 (ARM plaform with bootstage
> feature activated).
> Without this patch, the boot failed (at least for v2020.01-rc3 : crash
> has struct pointer new_bootstage is not aligned).
> 
> Or I will deactivate the BOOTSTAGE feature...
 
I think at this point I would prefer dropping BOOTSTAGE from those
boards for the release.  There's already been more than one "I think
this is safe" followed by "this broke ..." changes I've tried.  Sorry!

-- 
Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
