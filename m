Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5014D527
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:18:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CDB8C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:18:22 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA6A0C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:20 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id f24so1180065lfh.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xI9g+gcL4IXwzo78GzpmQqjHG2E4dca5kW1n9Pszr40=;
 b=UbaV1RA3s0jrkYYuXJX29RWtgF8cyoxdsf7MsCihCogfW5kxYHjZFsfllNPgs7XDa+
 R5kVlxczet5Umoh76jM8N9CHr5X5bm3/fC2crl++I7XzSWSrnAQRHRC0kwSNhafO+sjo
 B0Ze4tXsTgTeMypLohGzzmLxHy399gfo3W42I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xI9g+gcL4IXwzo78GzpmQqjHG2E4dca5kW1n9Pszr40=;
 b=PhCQbSfSUoU1/mivyrlzGErGNrbDIPnX65elCw+HWGDwVGfIlxu8osqj8qSGiN0O9C
 s2HKK2eb4mKWb11zu6B3k23HRnW3txp12eQmUGc+FuMXnJZjSfbRpJwfKagKi51rGLgx
 mTFkaT8sigmKJlu0f40Yo25X8QWC/mQSntRCcxUVhQ8Nkt9bPeUxCAuixuvNZyTRM3YG
 KiiG1ZmTKgkJbdUy2H9l8XJqDsEN3Fu5GdiNk2NzN5azARAp3hP0g/Tr7c+PdfIZkNkQ
 q/S/GMnTVmTrPuzLv6CC0qEottLnVgBUNaxZEed3lcSUo01PAHuRW2HyZUVjKqos5K23
 d8Pw==
X-Gm-Message-State: APjAAAWx3XpZe+IVpBKByo1Sr/LLV4PNwnEufUf/FVcHxDcx5Wmg8DAt
 ++nNK1IJ0NjH8twQxQ74RDuwJA/aJyfQ3aoE+ohRAg==
X-Google-Smtp-Source: APXvYqxs2kaz5YjaRjhvBFT4thXAsS9Ab4Px49khdF0tsIFrwepXZ8V/plUgNls91MVxH3aMNNopT1J8Rl2XhFfnc88=
X-Received: by 2002:ac2:5496:: with SMTP id t22mr1264087lfk.85.1580350699678; 
 Wed, 29 Jan 2020 18:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20200122135243.17683-1-patrick.delaunay@st.com>
 <20200122135243.17683-2-patrick.delaunay@st.com>
In-Reply-To: <20200122135243.17683-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:49 -0700
Message-ID: <CAPnjgZ287KBmPjbofTNdLJa++GpcjsDaz-vkP1S49yDtTEB0ig@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/4] board_f.c: Insure
	gd->new_bootstage alignment
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

On Wed, 22 Jan 2020 at 06:52, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> From: Patrice Chotard <patrice.chotard@st.com>
>
> In reserve_bootstage(), in case size is odd, gd->new_bootstage
> is not aligned. In bootstage_relocate(), the platform hangs when
> getting access to data->record[i].name.
> To avoid this issue, make gd->new_bootstage 16 byte aligned.
>
> To insure that new_bootstage is 16 byte aligned (at least needed for
> x86_64 and ARMv8) and new_bootstage starts down to get enough space,
> ALIGN_DOWN macro is used.
>
> Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - import: [U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment
>
>  common/board_f.c | 5 +++++
>  1 file changed, 5 insertions(+)

Ensure as Stephen says

With that fixed:

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
