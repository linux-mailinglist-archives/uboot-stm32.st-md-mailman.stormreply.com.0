Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F81A1E1E
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 11:38:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4217DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 09:38:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E230C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2020 09:38:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0389c0B9030852; Wed, 8 Apr 2020 11:38:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=N1gubVzgqmmorsy5TLkrLlVEk7zB24heTgFT29GiaOA=;
 b=KLyq/21EGgiLyQqiUKjKGv0bF/rHy4SoX1V09ec58+9lrBNqHRZ/QbgAC9325er5UiZz
 iztzopfmdjYj/4ASv5U5aOh41XTw3QKygj8eUgZFuW9ynu0nt6h94rYbBwI86FDN87N7
 qpNwquBQNibpnUDF6Mx3Su7GMtmrSxiOOaOzmaSnTD9Mb8W+YF81JFjbNh4+yQc2/9tL
 +vfs30t/X4w+HtDc2ZZR9TD18CFNNEX8zf+VFD44hHPfcniZOk3xvysN7ojPftFXovRR
 0RH9NbWw2SEVL+oViXvmX2fOKNU0fH+zYczSz55bBy/+I+JwrdewGviq09otaF7EKdF8 oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091k6u3jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 11:38:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E15D610002A;
 Wed,  8 Apr 2020 11:38:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB5E2222CB2;
 Wed,  8 Apr 2020 11:38:30 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr
 2020 11:38:30 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 8 Apr 2020 11:38:30 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>, Marek Vasut <marex@denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 04/16] arm: stm32mp: detect U-Boot version
 used to save environment
Thread-Index: AQHWDPmjfPDPV698I0yFpn+ldbTE8Khu7J1A
Date: Wed, 8 Apr 2020 09:38:30 +0000
Message-ID: <2bff39d04e0c4112b3f763c7d97921eb@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331160456.26254-1-patrick.delaunay@st.com>
 <20200401112615.931A024003E@gemini.denx.de>
 <8607d1778bcd4035807908e4a3a90381@SFHDAG6NODE3.st.com>
 <20200407162847.8884D24003E@gemini.denx.de>
In-Reply-To: <20200407162847.8884D24003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 04/16] arm: stm32mp: detect U-Boot
	version	used to save environment
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

Dear Wolfgang,

> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
> Behalf Of Wolfgang Denk
> 
> Dear Patrick,
> 
> In message <8607d1778bcd4035807908e4a3a90381@SFHDAG6NODE3.st.com>
> you wrote:
> >
> > To simplify the test:
> >
> > env_check = " if env info -p -d -q; then env save; fi;"
> 
> All such automatical "env save" actions somewhere in the code give me the
> creeps.  I've seen too often that they did things I nver intended to do or would
> have accepted if I had a chance to decide.
> 
> Use extremely careful, please.

Sure,

In this case, the command "env info -d" tests if the default environment is currently used,
So the user have never updated and saved the environment.

In this case and if the persistent storage is available (option -p), the script "env_check" save the environment.

PS: I take the initial idea from ./include/configs/opos6uldev.h and ./include/configs/apf27.h
 
> From a user point of view, it's me who owns the environment, and nobody should
> mess with my data without me confirming it.

As the save action is performed only when default environment is used, it is done before 
any user modification so I don't think that it is annoying for user.

I also kept the call this feature only in the ST specific bootcmd_stm32mp to allow customization for users or other boards.
(I prefer to don't add it in board_late_init() as it is done in board/intel/edison/edison.c)

The purpose of the "env save" is just to avoid a "Warning" during the boot, 
until the first user action and "env save" command:

Loading Environment from MMC... *** Warning - bad CRC, using default environment

The content of environment before and after the save is identical: it is the default one.
but if it is too aggressive I can kept it for downstream.

Marek do you have a opinion: it is acceptable for DH SOM using STM32MP15x SOC? 


> Best regards,
> 
> Wolfgang Denk
> 

Best Regards

Patrick Delaunay
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
