Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E569F42ECB4
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Oct 2021 10:45:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0A68C5C840;
	Fri, 15 Oct 2021 08:45:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9941DC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 08:44:58 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e12so25191000wra.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0Nasj32tZy7uDKdJqrhEhUCRFBAELmUq7G62oYUFs3Q=;
 b=zcFWPcqV9NLz0PWm6/+jr1rr5S9gP/d7CbymbY4Ap1HCLZ9AO30ugl8DhyyAd+KVkl
 zCAYRZJjZAbhJXp9Sg2RKAz/ByM1w8Ug1BI4VywcRNS7p2Xhgl8b2l2MWkQpmRvZbyce
 /0afNF7TWemdQUNhNfKezkVmFif4MsjNGvoSOxGMiPoSPmvayF5mAi4e3u2xrjcjRg4x
 DZkTGTJ53GBNPJy556AmAGZRIiqWzRGHZrTpTxvm1eV8qIzsnnPtEFmL9TSm1AwOD0uM
 ofKWfk7K7yfHn5g+Iw+rgurZiPnVBaxz/Fodm+3EKcxO8PGBdMPBZm2q0yvJbdfMvEwR
 WxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Nasj32tZy7uDKdJqrhEhUCRFBAELmUq7G62oYUFs3Q=;
 b=zgkRk2JoRpRQnivtFAZYYVemdjrmtg1VfpeK8UtzbTeEceiDIcpU+yoA4xIz9JnnUA
 KQlYN6U7Zlgd5oXmJafUYZuz8UQYcDkvM7zqvJ+LR3iX0bSpiVrXWpcSdUoTaA+KPchB
 Hg5jIATaqLpe/UfPlU1829fdoowty2CFLfUEysBcTtzJ+wJLyH89z8CGUkWDwFJMZUql
 NxjAXbDC01byl/eD0Q9hduDaJsN/WN8dn5KyDSVVjov3MecA1phXp8kTRw+J7kKJG3UV
 JJau46c2kPus3OJxeh95I/hEyVjXzZNZwO358Gkf9ro5WJaeX8PEuVhTjH26DxPmkchs
 ntUw==
X-Gm-Message-State: AOAM532GI63vTrsEKDZEEp4yZity+odj/oMhWo88I4Uz1L91SSQFxBSs
 D0VGU1xZd+mu10Z649e0NAdObQ==
X-Google-Smtp-Source: ABdhPJxB0d1mKdREHU16mvauUZ198vA8/Vr2ftr2/DLhL3v1pGPx0JzeWahw/qb95k7PQHrQ99PsJw==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr12747826wrw.176.1634287497651; 
 Fri, 15 Oct 2021 01:44:57 -0700 (PDT)
Received: from apalos.home (ppp-94-66-220-13.home.otenet.gr. [94.66.220.13])
 by smtp.gmail.com with ESMTPSA id j13sm4318644wro.97.2021.10.15.01.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 01:44:57 -0700 (PDT)
Date: Fri, 15 Oct 2021 11:44:53 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Simon Glass <sjg@chromium.org>
Message-ID: <YWk/hdvGkqMeLdTL@apalos.home>
References: <20211011210137.136188-1-ilias.apalodimas@linaro.org>
 <CAPnjgZ21PaYg8c39qEZm4Eb6g47s0LgL72k-FnHnr7zjXDD6JA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPnjgZ21PaYg8c39qEZm4Eb6g47s0LgL72k-FnHnr7zjXDD6JA@mail.gmail.com>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Nandor Han <nandor.han@vaisala.com>, Andre Przywara <andre.przywara@arm.com>,
 Tim Harvey <tharvey@gateworks.com>, Green Wan <green.wan@sifive.com>,
 =?iso-8859-1?Q?Fr=E9d=E9ric?= Danis <frederic.danis@collabora.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2] sandbox: Remove OF_HOSTFILE
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

> >
[...]
> 
> This patch does not apply cleanly on top you your other series.
> 
> Can you please resend it?

Done!

Cheers
/Ilias
> 
> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
