Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3C1A4B62
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 22:47:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 733A9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 20:47:43 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AD98C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 20:47:41 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f52so2982198otf.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 13:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BuyXpOfWxKTrQkkQh0vQI/0wufHL6do2cLFLE8oIDs0=;
 b=L4yt1DTQDJdrJiPwkmroS1SDz/HPcohTjQ9oy/1GiSBZjnp//eIVPH62vC5yk8qXdM
 gzokA+RoGRNMIUMI6vGQVYra9neY39WYQJe147ZAA854XBjAxbHqhq2iL912+P4/zkjC
 5ecmAesbE0Je93Gwt0iyF5FdYauSTPNlwAM08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BuyXpOfWxKTrQkkQh0vQI/0wufHL6do2cLFLE8oIDs0=;
 b=NVfw55IoQPowRFdARYmiwXHB+/tjBd7qmv3Lgm4VKfaayblAfWAEovzc4qcYVkdzWT
 JnoVriWyrPF3hgEFF/FpIIkfXx6y3d8pKpbirDHZy71TZxkt1ECaZ9NTp0iFKKEJWTXO
 YLY1rOV/2+5u+RLcCju6xRIdEadB95hYtP03oCO88p4RTA/v+Bv/m6DP9q9JErhNP0Px
 dSz06yboOoCdyRih0mox2gQeY7cm4rJ+Vtir0q7POyTM6J/FVEAL/KHEItHFWiLcEfNq
 MLTVqxR68fTW6L6mb+qi1I8yNa9tmYczy+ewKpjRWsZ7eDOo4KeRAuS/VORLxZ+peqGX
 U0TA==
X-Gm-Message-State: AGi0PuambyzegtHWqbgKSlJbc4x7eOYQ41rawZiqpW0uawtLvms6x9a2
 +qGtypIr239k0OGrmVDD2blcs4o4DpwxmmOVR0lUyw==
X-Google-Smtp-Source: APiQypLoAtw89zYUbqVs6CoFXiaA9o9NV7lBnx3An5xYfENrPiDKY+xeS9qBlPwLkfCZf/en7riMk8Py91AnnfmLgyY=
X-Received: by 2002:a9d:1e82:: with SMTP id n2mr5483322otn.356.1586551659767; 
 Fri, 10 Apr 2020 13:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
In-Reply-To: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 10 Apr 2020 14:47:28 -0600
Message-ID: <CAPnjgZ1HHPvgeGPF=KQA79DqY-TpUorgGZ9pXY_f7g1CZzbTPw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Thomas Hebb <tommyhebb@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] cosmetic: README: Fix one CONFIG name
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

On Fri, 10 Apr 2020 at 08:34, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Only replace CONFIF_ by CONFIG_
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
