Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884F42DDA2
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Oct 2021 17:10:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21607C5C838;
	Thu, 14 Oct 2021 15:10:29 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F522C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 15:10:26 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id u69so8888832oie.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HfoTSG4G9ttAktwS8qbDGs/xeHimJghtQCTc6VgOnuM=;
 b=IZ/QhB07i8aYsAE3o45q2VLarOqNccM0+4buMYEVjklGsygaVnHuthaTXjub9CzCW/
 /LEdtmC3CDpVSC/KelzW9g620iZ1y9Q5diUsUDdCuN2fqnrwjLEza4xHP2anpfhaxZAE
 k9gHzAZwJNhrviuCP0qQD28UY3q+9Q+xLiOWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HfoTSG4G9ttAktwS8qbDGs/xeHimJghtQCTc6VgOnuM=;
 b=W7YnykgAmU2gejx8y41JbPQLqaEbANm/vCE0k/1yUUJfh5VG1wfjcOQ/hBuSwrv4yj
 2uFWhizUG/rQb+koN9yhZZMtxgLBUU9z6QOYrUvhmWgh0L1wPTqXH1wIsQhWuIVn9SzF
 9zHa8ja9I6wsdLm8QRnD+eQFimLjBywXcH9E13YUpw49b328rZK/dJzsdYfgKKXd868w
 vK1CsfS6DLXWpJGxIE6T4JsqdmKL0s2uLgbBBWZd8PjBvbtXVh+B7i7iiv9rJAX7Wfxx
 F0FN9w7SckDlOLEHXFGN8YahxBatPXS/NgENW69/G6o2qdpfVpEVskweGIZZZP5yWk7I
 9+TQ==
X-Gm-Message-State: AOAM531+1sm2lHMp/wPdk5ohQINXLP4v+nPYY9xlb24pQGfxE7hIVznS
 zvDlSBh2qKGJw5h87Hhml6elTEm6Yu7QTcaleHd+Ww==
X-Google-Smtp-Source: ABdhPJwRkeSruh80G6Oh/r/UYpaB0C8gsT0xKBLdLroTYttF/5kb2wP9wdLik9Kdva8SpC6+vOMQnrE1q1bC/ocMOSc=
X-Received: by 2002:aca:4283:: with SMTP id p125mr12399780oia.81.1634224222778; 
 Thu, 14 Oct 2021 08:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.4.Icb58232aa80ebd59b9530f565f0189067d43568a@changeid>
In-Reply-To: <20211004115942.4.Icb58232aa80ebd59b9530f565f0189067d43568a@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:09:39 -0600
Message-ID: <CAPnjgZ1zi8Bor_1gWePcomJP8QnWZpL7G7Bw_bzS59BYbq5U=Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stefan Roese <sr@denx.de>, Wolfgang Denk <wd@denx.de>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Matt Merhar <mattmerhar@protonmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 4/6] Remove unused
	CONFIG_SYS_FLASH_AMD_CHECK_DQ7
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

On Mon, 4 Oct 2021 at 04:00, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Remove the latest reference of CONFIG_SYS_FLASH_AMD_CHECK_DQ7 in code
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  include/configs/P2041RDB.h   | 1 -
>  include/configs/corenet_ds.h | 1 -
>  scripts/config_whitelist.txt | 1 -
>  3 files changed, 3 deletions(-)
>
Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
