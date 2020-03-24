Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6132190830
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:51:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FAD0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:51:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8B20C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:51:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8mkY1012412; Tue, 24 Mar 2020 09:51:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sqXDHYW4LKNNAi8cWSxiLd1ogK5o1PVSXPmawVI+9C4=;
 b=kBfmbCa1RjwQCbVx/xQJN+tHH+fIdDkbuBpwj7lpAuYkcet+BbuWE4xy3neDNQ6mNoL3
 75yBLxynKufLsfUyHPjt8YEGnwlXwtPKNa9ZU1YNi7F9gN9dmYuFyFI77Y6zg1Rhiz5H
 xy3lnlkkm8azdzB3FD5QRXjinHEHnL5gvmeczxqur4ClOFU4fH1NGdSrcEwBqhirYH4g
 Jz6yAByEDGT19AM9dk2XF1EHzmaW3HM6bGA+y0mWz0YM2Cv3wrpWLjsCRxclk115qajL
 SuZeoG3Fvn20fa4QoxVQ7MI+ME8VzKGLES9chZU+YjT+jVckaMwrCeWPJfP2MAPBdDOh 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9jyxd5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:51:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A3B8100034;
 Tue, 24 Mar 2020 09:51:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9320B21FE91;
 Tue, 24 Mar 2020 09:51:53 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:51:53 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:51:53 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 9/9] ram: stm32mp1: the property st,phy-cal becomes
 optional
Thread-Index: AQHV86AKTPuwgK087U+lRfFjI1ApjKhXi5Rw
Date: Tue, 24 Mar 2020 08:51:53 +0000
Message-ID: <3a0f6f4d3f87472eae7b92cea18c8030@SFHDAG6NODE3.st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306101412.15376-2-patrick.delaunay@st.com>
In-Reply-To: <20200306101412.15376-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 9/9] ram: stm32mp1: the property st,
 phy-cal becomes optional
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
> Sent: vendredi 6 mars 2020 11:14
> 
> This parameter "st,phy-cal" becomes optional and when it is absent the built-in
> PHY calibration is done.
> 
> It is the case in the helper dtsi file "stm32mp15-ddr.dtsi"
> except if DDR_PHY_CAL_SKIP is defined.
> 
> This patch also impact the ddr interactive mode
> - the registers of the param 'phy.cal' are initialized to 0 when
>   "st,phy-cal" is not present in device tree (default behavior when
>   DDR_PHY_CAL_SKIP is not activated)
> - the info 'cal' field can be use to change the calibration behavior
>   - cal=1 => use param phy.cal to initialize the PHY, built-in training
>              is skipped
>   - cal=0 => param phy.cal is absent, built-in training is used (default)
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
