Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1942DDAB
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Oct 2021 17:10:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96ECCC5C839;
	Thu, 14 Oct 2021 15:10:54 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90C17C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 15:10:52 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id m67so8877954oif.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Is0Vq003Tb/o5NTj/gYL5AZ2QDEnqI4qPeUNaONtKzU=;
 b=VvbafhgJp3wo4s0kTVQD99C3ZPGYQ4vNnNvPutSEd2ahBKIcBfp1/UaQdK8ORR4a8u
 vcIw7xlBKae+oiPGgj8wtWZj1ZbUq5TcY8FOyfLNeeNZ5GO9atdKC1aeFHYI1ZIwIJ6R
 oXz3pK5TvV4v+cQS0s/7Yemy7Pk90lSGgoZgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Is0Vq003Tb/o5NTj/gYL5AZ2QDEnqI4qPeUNaONtKzU=;
 b=OlRMtun0D3SzwqaRlrLkncTgFZV16fyIixqvEG+cuL3R3hszJX7DmB4MNXYUn0KxwU
 Iz8bV7vDA1N1g3ViFN0ED3fBGxLnylER+wLEv6Fy/HcSjKFTuwD3f+tIzUkyAwlgrAK/
 ErweU6CiHymsyQOiEsSc8IvhyR679Nsawd97Ol80UGeOIm80J9xtVJiq8t27LyKDrcXO
 PQHFxrDxdbfqaOAcTnIDA9wxHim30Tps5tfeBLTSOkOpFCEoWmTKzpKamHnJavhywJGt
 F2nvBWgnnOKm+zZmrhK+rdl8wiXkSVGjoMT15u+pLMyViv4Tvhf1svYZWOUGxzQTx/QS
 4tbQ==
X-Gm-Message-State: AOAM532SCCLGdL/vC8kjTiITB2v9FIiR0EYb2SlYSsDurwCHG1YnFeZH
 KMg93dh4whXDDDC+q1sdeXgCmjACQAKkCIPf91Jsaw==
X-Google-Smtp-Source: ABdhPJzo4gSqWDWUstGtdZiONKMVssp/CMnxg8DuqkOoObV67TXiU+qChxyR6+SKexFzolhGtmz0Hcs+V+5Tm8tz/Wc=
X-Received: by 2002:aca:4283:: with SMTP id p125mr12401937oia.81.1634224247085; 
 Thu, 14 Oct 2021 08:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.3.Ibc8e0107187c533ff2b9f71f30b5abfe1e47e22d@changeid>
In-Reply-To: <20211004115942.3.Ibc8e0107187c533ff2b9f71f30b5abfe1e47e22d@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:09:38 -0600
Message-ID: <CAPnjgZ3OXCmTZ6NWEOC2=UFn7xF_-nYAWWJgeqqajjLUs=EBXw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/6] Remove unused CONFIG_NO_RELOCATION
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
> Remove the latest reference of CONFIG_NO_RELOCATION in code
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  include/configs/thunderx_88xx.h | 1 -
>  scripts/config_whitelist.txt    | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
