Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3C8480769
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Dec 2021 09:33:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33725C5F1EF;
	Tue, 28 Dec 2021 08:33:10 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4395DC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 08:33:09 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id p4so28986130oia.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 00:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e0qzHgmNFDOIKFcEzMtY5ovPKo8dis4U/F7UiKMXb1w=;
 b=ddZBphey/pQfYvhuxds/y6uAl1mQlq7YkyzlC8R9BogaqL3NdnRcKwL0H05IQCxhDa
 C68+StvOKCRen8HNx85nSHAPW10bVxWw1YXng4vmbrKJWt12sIgqntzNHHJlWbsHV0CI
 pexvuSCzUwClEeIZiAH2aX0/LrvaQ+flXpBZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e0qzHgmNFDOIKFcEzMtY5ovPKo8dis4U/F7UiKMXb1w=;
 b=hf8nKLIzodACDs3q0OFDVrP81KLDYzri8gC5OpG9jvHvgBpsTlUvGQGtLeXKK/K6gc
 /1f21Hez0eX93+1sGcU4IXWm3SlkJYzH3Eck6POpp+PeRGZjAbQ2bvdfO/ppwKFkP5eb
 EPA7uuLWuUak6fZdmwAC1S02M29zbUbCiajMKN5KOxsjZAOqtfXkK9qfUgKBuYkBKXiz
 Q1GDiT1Ma0dmLIaUNxb0GfSIa3Aspkk4ef7Oza9cJKY1CYpca/vQbyFd/7uOyQXi2tcZ
 g/vBz1sB1JMWsfSnuU5lq4lPfVe6WHesw3+FSkJg1GsQHFibNsh1SZkkxNKFz+zwPuFx
 nHEg==
X-Gm-Message-State: AOAM5330O73BemK24wITd/PeGguZcJC1rJgvEYggA0XgBysSl+Z+KfxO
 YT7NrnInGMp6StFNXm5XoLPCovOPOabMji3MTMjrzA==
X-Google-Smtp-Source: ABdhPJyps8KsIItzS8+TaL6NfRY52poGyly5DoC7xBs4t4Iz9aasob/eGpeGahCKhvjE5FH3bUWrE1ngQDCngVw9HFk=
X-Received: by 2002:a05:6808:bc9:: with SMTP id
 o9mr15859392oik.150.1640680387876; 
 Tue, 28 Dec 2021 00:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
 <20211214175652.RFC.2.I0180e07a31210ff2679a02de4221a54e12169593@changeid>
In-Reply-To: <20211214175652.RFC.2.I0180e07a31210ff2679a02de4221a54e12169593@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 Dec 2021 01:32:56 -0700
Message-ID: <CAPnjgZ2wrB8EKjNyRFkAcDgwpcY-DEDq1XhL3dAS_iNq3Ez7gA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [RFC PATCH 2/5] mtd: cfi: introduce
	CFI_FLASH_BANKS
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

On Tue, 14 Dec 2021 at 09:57, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Replace CONFIG_SYS_MAX_FLASH_BANKS by CFI_FLASH_BANKS to prepare
> Kconfig migration and avoid to redefine CONFIG_SYS_MAX_FLASH_BANKS
> in cfi_flash.h.
>
> After this patch CONFIG_SYS_MAX_FLASH_BANKS should be never used in
> the cfi code: use CFI_MAX_FLASH_BANKS for struct size or CFI_FLASH_BANKS
> for number of CFI banks which can be dynamic.
>
> This patch modify all the files which include mtd/cfi_flash.h.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  cmd/bootm.c             |  2 +-
>  cmd/flash.c             | 34 +++++++++++++++++-----------------
>  common/flash.c          |  2 +-
>  common/update.c         |  4 ++--
>  drivers/mtd/cfi_flash.c |  4 ++--
>  drivers/mtd/cfi_mtd.c   |  4 ++--
>  include/mtd/cfi_flash.h |  9 ++++++---
>  7 files changed, 31 insertions(+), 28 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
