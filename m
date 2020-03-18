Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ECC18A025
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 17:04:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D402C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 16:04:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3791FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 16:04:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IFliuu006848; Wed, 18 Mar 2020 17:03:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JvfGknmafd3uABhk+EAdfmvaorFvRvlyG/UvOQktsis=;
 b=On6ElwtshCLYKi+EhY5RV63Gzjpql3GhQGkt3QDXxenLhSHdGdMbcNtTfdbFUGRMPW53
 AjFEVHzWIpaKxXSq+eUljj3T5Yi/dXaBNPDKPXdeESyaFEqkQIrqqksOhSaH+d5Lsk5a
 4K4ze4s1YNfDZmOgBRrk/c8u//uIV8u4MSYcPS4waxSOQYKuCKhu+IKC8kKZSqWwNkPN
 TkOH5F6XSORYOj+88m1QcplfIaiYFR6/VUQsga/IXYkc5YA+GkZUpLNr769v0hq5AVDe
 PS6ed9BZTO+taXjxRnysr3zB7y9AgWB1neCiu1Apy7Ke5pr/cogJw046Mquh+VBbdCO5 oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etcrsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 17:03:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCF4A10002A;
 Wed, 18 Mar 2020 17:03:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB8B82BEC78;
 Wed, 18 Mar 2020 17:03:43 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 17:03:43 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 17:03:43 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Tom Rini
 <trini@konsulko.com>
Thread-Topic: [PATCH v4 2/3] env: introduce macro ENV_IS_IN_SOMEWHERE
Thread-Index: AQHVebukdwkGt7rCEEaTlWiTOUuRyahPiGmg
Date: Wed, 18 Mar 2020 16:03:43 +0000
Message-ID: <10a43d3c3d2a4c82b5853a4457ba10b7@SFHDAG6NODE3.st.com>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
 <20191003072428.19197-3-patrick.delaunay@st.com>
In-Reply-To: <20191003072428.19197-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_07:2020-03-18,
 2020-03-18 signatures=0
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Lukasz Majewski <lukma@denx.de>, Joe
 Hershberger <joe.hershberger@ni.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Ash Charles <ash@gumstix.com>,
 Wolfgang Denk <wd@denx.de>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam
 Ford <aford173@gmail.com>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v4 2/3] env: introduce macro
	ENV_IS_IN_SOMEWHERE
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: jeudi 3 octobre 2019 09:24
> 
> This patch introduce a macro ENV_IS_IN_SOMEWHERE to check if the the
> environment can be saved somewhere, in a storage medium, without assumption
> on CONFIG$(SPL_TPL_)ENV_IS_NOWHERE.
> 
> Since the commit 208bd2b85ecc ("env: allow ENV_IS_NOWHERE with other
> storage target"), it is allowed to activated ENV_IS_NOWHERE with other
> CONFIG_IS_IN... in U-Boot.
> It is only allowed for U-Boot but the remaining restriction in Kconfig could also
> removed for SPL and TPL (depends on !SPL_ENV_IS_NOWHERE / depends on
> !TPL_ENV_IS_NOWHERE).
> 
> This macro ENV_IS_IN_SOMEWHERE can be used in code to check if the
> environment for U-Boot / SPL / TPL is really managed (at least one
> CONFIG$(SPL_TPL_)ENV_IS_IN_.. is activated).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Hi Tom,

I try to solve default environment size issue in patch =

http://patchwork.ozlabs.org/patch/1257545/
[RFC RFT PATCH] env: spl: filter the variables in default environment of SPL or TPL

But as it is not acceptable and I don't see other solution for this serie.

I won't push v5 for this serie and I considere this serie abandoned.

http://patchwork.ozlabs.org/patch/1171098/

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
