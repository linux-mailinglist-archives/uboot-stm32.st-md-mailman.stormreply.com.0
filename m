Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DB7871FE
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 16:43:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 239BDC6B44F;
	Thu, 24 Aug 2023 14:43:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35AD6C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 14:43:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-52683b68c2fso8610773a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692888223; x=1693493023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lS9AnjAc5vOpuaRheWKVWJTcL0st0cTATH/ZCzfIwTc=;
 b=Th19DhK4azYhc3GWFjyenE6eBPTCCrC+A7s4/pJ0z8Ux3bPKzKwxy+soEXvV+5EDe2
 O6x2IpaJz3C//W94RGWzzgv3Ni5DEHB/D+ZAreaBj8PsJzg+/ILEv6CEH3yiI6rGZWUQ
 lpFrwdaG9XIfx5ucI5XEOihpvIwyUfjX0SxPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888223; x=1693493023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lS9AnjAc5vOpuaRheWKVWJTcL0st0cTATH/ZCzfIwTc=;
 b=JQ7iBP++Ela2UwSdUPRlvb+RkShcNOYBV/bIcCWEap6L7ZHLC4WNlHtA4s6c6Tria4
 20Hzu8/zQ5vngT3U9pURQUf7StXaF7C8XWObRrgMqXZjzA6uKzkpnFscHgg1GHMidJqU
 BHkqE0yPJsCkwqGZGRqeg3fw8fzdI1gFPMBRHut1ZSyoy3nQgqRXjPGadiDUE9CBdG02
 NopBvyk4AclaNXnWh23LBgsq3GRVW32SfZCTdvU2I7vQUZU/ykvux54QTu0Kd7bKFYod
 4U8H1c4IJTbqfr3FR4zzDlJReAZor36MdZ0G79HDxcNqTLwglfc8Bviu35+LRT3XxIuG
 c+xQ==
X-Gm-Message-State: AOJu0Yww5M07vhMNVB4v8mVqq4c88acytYnHpw/STvEvM9HB0sj3JFbg
 RQMafBAjvjCx700pXfoWhIMF+SfXB8Hgy9icUnnC3w==
X-Google-Smtp-Source: AGHT+IH7UhTc7N76QmBeYUbPfTk5vH0JaT962GuPchS5LH7KrCulJ8BrDim3EPG7eLfbLivyKCPewLfu+PSYHt2Yz1I=
X-Received: by 2002:aa7:df89:0:b0:523:38eb:395f with SMTP id
 b9-20020aa7df89000000b0052338eb395fmr11656959edy.2.1692888223537; Thu, 24 Aug
 2023 07:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <9f4019b9e46d3fae5bbfad6d06ff6bf9@walle.cc>
In-Reply-To: <9f4019b9e46d3fae5bbfad6d06ff6bf9@walle.cc>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 24 Aug 2023 08:43:32 -0600
Message-ID: <CAPnjgZ0MNb5aAtmz9Yk+JiHxQt+qwhQW=WccgiiRRqfQ-a1OBQ@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neha Malcom Francis <n-francis@ti.com>,
 Vikas Manocha <vikas.manocha@st.com>, Ivan Mikhaylov <fr0st61te@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
	extensions for build output
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

Hi Michael,

On Thu, 24 Aug 2023 at 01:32, Michael Walle <michael@walle.cc> wrote:
>
> Hi,
>
> > This series adjusts binman to enforce just 4 extensions for output
> > images:
> >
> >    .bin
> >    .rom
> >    .itb
> >    .img
> >
> > Other extensions will produce an error. With this rule observed,
> > buildman
> > can keep the required files.
>
> How does this work? I didn't get all the patches from this series, which
> makes
> it really hard to review or ack the individual patches.
>
> Are we just whitelisting any files with these extension? Honestly, this
> sounds like an arbitrary restriction to me. But maybe I'm missing some
> context.

You can see the full series here:

https://patchwork.ozlabs.org/project/uboot/list/?series=370121

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
