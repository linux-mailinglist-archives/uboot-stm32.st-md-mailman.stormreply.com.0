Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F20A218A02F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 17:06:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B754EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 16:06:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32EEBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 16:06:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IFmlZt002455; Wed, 18 Mar 2020 17:06:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Rx1L9R7GomIyat6/v4EUrUl1fVENXrGUsIJdcGTsbbE=;
 b=QfJ+nm1Fhx1K1/fIq3rhTQ/JDIPTexXME73R+qxKD/C3NlU/UynUzxqW4UPQAMdmOots
 m/Vg5ojl/9bKnZ+CtkuCXAmPJzbPGzZ23qPT8/YZRyg3bhEGZAJKpxATpe7NFicdNxe6
 z8WVofVT4qnTJXtwqIwl1tr9u97QFWb4zp5QqyinxoeFGHQia4Udw8fY3oNEPq+H1pCO
 0sddnpRgdSmIqgYGdtVwO9DU9x2/IVnOH/noda4a0squccMcccPCgc17hR5DhKwPcJJS
 +2WNiCrcWhz4RvlFoT5ce2cGV47rqEOQL5DHyy9T9tN9sM3ev0ogxnYs1hmwpfIn8CQ7 oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdd4ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 17:06:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DED610002A;
 Wed, 18 Mar 2020 17:06:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D7062AF332;
 Wed, 18 Mar 2020 17:06:03 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 17:06:03 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 17:06:02 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Tom Rini
 <trini@konsulko.com>
Thread-Topic: [PATCH v4 3/3] env: Add CONFIG_ENV_FULL_SUPPORT
Thread-Index: AQHVebulHd4l62JRsUqktuT6G9ATgKhPiimA
Date: Wed, 18 Mar 2020 16:06:02 +0000
Message-ID: <1268da43d27a4f11b49e6e3a68e76a28@SFHDAG6NODE3.st.com>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
 <20191003072428.19197-4-patrick.delaunay@st.com>
In-Reply-To: <20191003072428.19197-4-patrick.delaunay@st.com>
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
 Lukasz Majewski <lukma@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Ash
 Charles <ash@gumstix.com>, Wolfgang Denk <wd@denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Simon Glass <sjg@chromium.org>, Anup Patel <Anup.Patel@wdc.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v4 3/3] env: Add CONFIG_ENV_FULL_SUPPORT
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
> To: u-boot@lists.denx.de
> 
> Add a new flag CONFIG_ENV_FULL_SUPPORT to compile all
> the environment features (attributes, callbacks
> and flags) in U-Boot, TPL and SPL.
> 
> This flag replace the existing flags for SPL and TPL
> (CONFIG_SPL_ENV_SUPPORT / CONFIG_TPL_ENV_SUPPORT), because
> the same support of environment features is mandatory for U-Boot,
> SPL and TPL.
> 
> To deactivate the load/save environment support in SPL / TPL,
> the board need to activate CONFIG_SPL_ENV_IS_NOWHERE or
> CONFIG_TPL_ENV_IS_NOWHERE.
> 
> With this patch, the environment is activated by default in SPL
> and TPL, which include the content of default_environment[] as
> U-boot. To avoid to increase their size, this patch also add
> 3 new confif : CONFIG_$(SPL_TPL_)ENV_DEFAULT.
> It is deactivated by default for SPL/TPL and activated by
> default for U-Boot, the default environment for SPL/TPL is empty
> and it will be populated only when it will be loaded from storage
> medium.
> 
> All the test on CONFIG_SPL_ENV_SUPPORT are replaced by the
> ENV_IS_SOMEWHERE macro, which tests if the environment is
> storage medium.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
Hi Tom,

I try to solve default environment size issue in patch =

http://patchwork.ozlabs.org/patch/1257545/
[RFC RFT PATCH] env: spl: filter the variables in default environment of SPL or TPL

But as it is not acceptable and I don't see other solution, 
I won't push v5 and I considere this serie abandoned.

http://patchwork.ozlabs.org/patch/1171180/

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
