Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DC1907F3
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:46:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03CEEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:46:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C5B5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:46:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8c9nd013397; Tue, 24 Mar 2020 09:46:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=boGAzlbTrgFhpOU1sQHOk36M1VTCAzr8BFAjDTu0LDo=;
 b=inoQ0ksuAoblGG/2uh6pRJdE2mnjauhGWAPnLK/mftFx9ipG+0WFUpE3LW4nwD25/dL8
 WyXavRoxGiYzlE970QpCKomE5qHfzJPWQGtXR5u9rSXMKxLTbf2NM4ABM0ovpLvtXa8t
 SIE1I4LwCu9pjkpjP/FxtLxUddX8DBvAA6ZIOOydTAUPcAS9p89UQb68Q8juU6WtgkWV
 GgN9aODkCEd2QHoFG8YoU1AlJs2Xv1l1BFJRSHRw7SHJfDNb/8cFYx80cVvZqidB8CEw
 HmsoRTatcF3WcuCwZbply6Nkpns10K/g5AkI156RIm6zRArsZg/HNz/4k+YJZG1fcV1F Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xdxh9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:46:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14ACD10002A;
 Tue, 24 Mar 2020 09:46:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D31652126C9;
 Tue, 24 Mar 2020 09:46:22 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:46:22 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:46:22 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2] ARM: dts: stm32mp1: DT alignment with Linux 5.6-rc1
Thread-Index: AQHV89fv1c+KdZOxMU6QhnGreZ+NbahXiXig
Date: Tue, 24 Mar 2020 08:46:22 +0000
Message-ID: <92f2be01b7cf40a18603ff08246b9a56@SFHDAG6NODE3.st.com>
References: <20200306165441.10760-1-patrick.delaunay@st.com>
In-Reply-To: <20200306165441.10760-1-patrick.delaunay@st.com>
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
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: dts: stm32mp1: DT alignment with
	Linux 5.6-rc1
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
> Sent: vendredi 6 mars 2020 17:55
> 
> This commit manages diversity for STM32M15x SOCs with:
> - dedicated files to support all STM32MP15 SOCs family.
>   The differences between those SOCs are:
>   -STM32MP151 [1]: common file.
>   -STM32MP153 [2]: STM32MP151 + CANs + a second CortexA7-CPU.
>   -STM32MP157 [3]: STM32MP153 + DSI + GPU.
> - new files to manage security diversity on STM32MP15x SOCs.
>   On STM32MP15xY, "Y" gives information:
>   -Y = A means no cryp IP and no secure boot.
>   -Y = C means cryp IP + secure boot.
> - stm32mp157 pinctrl files to better manage package diversity.
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
