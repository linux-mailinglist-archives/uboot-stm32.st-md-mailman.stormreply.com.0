Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D042DD9D
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Oct 2021 17:09:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30413C5C839;
	Thu, 14 Oct 2021 15:09:58 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B553AC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 15:09:56 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 w12-20020a056830410c00b0054e7ceecd88so8693599ott.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ui0NI0vTZQuoUQciALj8dUAwR1F7Rg51YqTCoPQa3Tk=;
 b=m8uaPdLqqWVbAsn5eOm5bWPRRbrV0a8XQVt4GOIKEkpeUHRcJvQKz/ufNGoffLmlFS
 d32ANh7hcmLmpqv2PFOqvHt8pZtBowh3qVo2Z8cmo1ykOfxAjls+X0jO+plG4dyhNCst
 qBxp960QD7g5RYqgiBbqUsC0BAYk3NWbrcviA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ui0NI0vTZQuoUQciALj8dUAwR1F7Rg51YqTCoPQa3Tk=;
 b=dBJn8Flh/HDwla/wHvCbCmVMm7LpH1lI1sa3xp5+XsdHp7YXenaINipeJ5xHsEnmuM
 cH5vi0tWx6F+A9YFwLhiro1NkLEMM8aBe+58DgSscazFlGynYn+ABCYeHJAzyVV3XOMO
 4uBIJJQQgT95rQd/+tHErRZkvcGUNvCp0l6bl5WlyYI9OwlZ5d17TnEjibnPmhy3Thd0
 bLCph/tkSYFcKy37TU6iUhMtUiuySjsYAyX9EvQdtVxekF8ne0xL18Z95UJEWu4nUHrd
 RMRU9DyOgaOFN8Eipqk3Rx6nTiyuom0zn03Kcsf4Ay86wh7JV1KYoxFMucdyC0OQAjhE
 I5uA==
X-Gm-Message-State: AOAM533l1rewyNM8xJPIxagtNX30hlqHp4Ni7ikVSVYc34cZULy3vhBF
 aOQ5+kWIPyIKP9rgRNsoogE8o5gXpA0Jix0pCxNwuQ==
X-Google-Smtp-Source: ABdhPJweIbACIbpoL+nxo/ZUVJyXRNFwVGePIA+oz+dA8QRNebHoUsZkTfc0CX3INQFjeAZbDYpdT2oIFlQz+F6dgsU=
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr3124685otj.191.1634224195279; 
 Thu, 14 Oct 2021 08:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.5.I524a7a0139ad01d1a9b935314446e64fec9d5b8b@changeid>
In-Reply-To: <20211004115942.5.I524a7a0139ad01d1a9b935314446e64fec9d5b8b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:09:41 -0600
Message-ID: <CAPnjgZ2O+L73Z8nvh3-bj=ndtJtwn9U-tSy__zHNDf+EDodgsQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Heiko Schocher <hs@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Rick Chen <rick@andestech.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 5/6] Remove unused CONFIG_CONS_NONE
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
> Remove the latest reference of CONFIG_CONS_NONE in code
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  include/configs/MPC8560ADS.h | 1 -
>  scripts/config_whitelist.txt | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
