Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56741AFE22
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Sep 2019 15:54:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0E40C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Sep 2019 13:54:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 823D8C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2019 13:54:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8BDpUIN032125; Wed, 11 Sep 2019 15:54:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6hl88Vc+jjr3PeNIzq4+EVQgB5YlU2BYRD3diaG63sk=;
 b=YTmz4EK+hnL2Hi71lBQc/WmmPyuYMRMd7UFSjbKJL2e8Gu4CHWqHcxa16DUcyJS2W6Ye
 jzb61OKJHaNFC7iFGvbZqvqZ7Yf1bXSNV7DXMnPaKOSzf+T9mVzlEUxq9u21YzUohIuV
 KxAMfrzYdpHKw83I9fTTSDGjj7nBAb503OGCEVC/nA9wPwaAJCnLQITZmJbmQUw9ibl0
 o6V+h3yk4cD5i5eIHZKZbaJJn1WndmPbVIzQo4XmzYScebcWHD8aZJJzq2ZxXxxTr9ML
 /ThVIjOEnapopRqgj9gAtsbWlkQavMaEJnam/HbfXsZQpS0My8swR3I2IHO7JF/mc8T9 LQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uv1paktvp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 11 Sep 2019 15:54:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CB91C24;
 Wed, 11 Sep 2019 13:54:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 903FF2C7F3C;
 Wed, 11 Sep 2019 15:54:16 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Sep
 2019 15:54:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 11 Sep 2019 15:54:16 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [U-Boot] [PATCH] env: Add CONFIG_ENV_SUPPORT
Thread-Index: AQHVYnpO9RDl78dH/0CQ7vwuqVbTS6cf/seAgASvGzCAAFXLgIABhDag
Date: Wed, 11 Sep 2019 13:54:16 +0000
Message-ID: <53ab8aba443a44e5802c0a2fb48add89@SFHDAG6NODE3.st.com>
References: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
 <20190907115149.42B2624009F@gemini.denx.de>
 <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com>
 <20190910163039.984F9240039@gemini.denx.de>
In-Reply-To: <20190910163039.984F9240039@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-11_08:2019-09-11,2019-09-11 signatures=0
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Eugeniu
 Rosca <roscaeugeniu@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] env: Add CONFIG_ENV_SUPPORT
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

Hi Wolfgang an Tom,

> 
> Dear Patrick,
> 
> In message <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com>
> you wrote:
> >
> > And I agree the name seens not perfect.
> >
> > > > - CONFIG_SPL_ENV_SUPPORT for SPL
> > > > - CONFIG_TPL_ENV_SUPPORT for TPL
> >
> > These pre-existing name are defined in common/spl/Kconfig
> >
> > With the same issue (env/common.o env/env.o are always compiled for
> > SPL/TPL so it is alo bad names)
> 
> Correct.
> 
> > > So please reconsider this whole implementation, and make sure that
> > > only a single macro ise used everywhere to enable these features.
> >
> > But, if I use the same CONFIG for the 3 binary SPL,TPL and U-Boot, l
> > increase the size of TPL/SPL for all the platforms when these
> > additional features are not needed.
> 
> Either the U-Boot environment makes use of these features, then they have to be
> enabled, and exactly the same way in SPL, TPL and U-Boot proper.  Or you don't
> need them, then they can be disabled, but again in a consistent way in SPL, TPL,
> and U-Boot proper.
> 
> It is not acceptable to have for example .flags support in U-Boot, but not is SPL.
> If you cannot affort the size in SPL (and need environment there at all), then you
> cannot have it in U-Boot either.
> Yes, this is sad, but anything else would break the implementation of these
> features, and given that they are often used to implement some level of protection
> or security, introduce massive security issues.
> 
> 
> So if SPL size is critical, you can try do not access the environment at all and omit
> _all_ of the environment code there; or you can try to arrange for a read-only
> implementation (omitting at least the code needed for "env save" including write
> routines to storage).  But you CANNOT omit the extensions if these are present in
> U-Boot proper.

I am working on a update of the first proposal and I will delivered it in 2 step:

1- a  simple patch to solve the regression
    (to have short term solution  / integration in master as requested by Tom)

2- introduction of CONFGI_ENV_FULL_SUPPORT
	=> compilation of attr / flags / callback for TPL/SPL/U-boot
	=> feature can't be remove in SPL/TPL independently 
	As proposed by Wolfgang


> Best regards,
> 
> Wolfgang Denk
> 

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
