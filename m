Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B9DFEA9
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 09:51:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED76CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 07:51:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AECDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 07:51:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9M7kZH1016267; Tue, 22 Oct 2019 09:51:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=hlBY9oBNwZIadUq0df8noekIqnci8cL8PaNZQEOkyew=;
 b=q7OsB/54YiloQhAYTsKOsw7fzZ9+PP1VFhRjVFSFLlsfPfLe7eIg2bRkkbOD7JPL95hw
 R0tWIHYtv64Ect3dnQvblaW+Wfqr/KD0ksHiuWhWlW4u9UtwMNwmuOhHJXurDNMyvMbn
 UeT+lKS9d2YCzPnFfBkkDJaSmzfXeHdWgAGbn/BC8AORckOIgXUCwl/Xjqu8q2NjVdMg
 tVTNFvVQafpmL90Ri5wYY2KuWYuXKYUAQjdG7SuyzRYPmSfKEITmS93dJmIUF4ZCVEhM
 GfdMkI7BlmT4LP5ZUS3QjWXy0k5dSqgPORf8WSmjTDTPT7kAR3J8+6UqMOAZ3jrbCCyS /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vqqy166x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 09:51:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1226C100034;
 Tue, 22 Oct 2019 09:51:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEC282A856B;
 Tue, 22 Oct 2019 09:51:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Oct
 2019 09:51:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 22 Oct 2019 09:51:15 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Anatolij Gustschin <agust@denx.de>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [U-Boot] [PATCH] pinctrl: Kconfig: remove duplicated nodes
Thread-Index: AdWIrXbM5GfbKvYRQwqFmR5zz4Fc3Q==
Date: Tue, 22 Oct 2019 07:51:15 +0000
Message-ID: <da38a7fc7ed7405fa21c4bbc9aa56b2c@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-22_03:2019-10-21,2019-10-22 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 David Wu <david.wu@rock-chips.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Chris Packham <judge.packham@gmail.com>, Christoph
 Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] pinctrl: Kconfig: remove
	duplicated nodes
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

Hi Anatolij,

> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
> Behalf Of Anatolij Gustschin
> 
> Hi Patrick,
> 
> On Mon, 21 Oct 2019 15:07:54 +0200
> Patrick Delaunay patrick.delaunay@st.com wrote:
> 
> > Remove the duplicated configs introduced when the same patch is
> > applied twice times:
> 
> There is already a patch pending http://patchwork.ozlabs.org/patch/1179889

Yes, I see your just after that I sent my correction.

Thanks and sorry for the duplicate patch.

> --
> Anatolij

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
