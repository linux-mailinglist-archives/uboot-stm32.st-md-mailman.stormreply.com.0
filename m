Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2543810B06D
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 14:39:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB3E4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 13:39:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF320C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 13:39:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARDM3Jr000773; Wed, 27 Nov 2019 14:39:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=32Zz41ZxwvZT0J+Pc12DiZrPDrMY5y7IfM+zcybvdIk=;
 b=ARtZvF01xJJaEcepKH6sxJmSAOxfZwCP85ZwTwzxqrMgQr2R8Vxli9MyUj/yOtNjSozT
 HcgYaCi7IphFYYgIN1/gQzvzqJcQfWK7w2pnLBRfiXEgAr4riIZoMajqXAlwY2Kx7eVI
 ZMfAG7V1YFe+qDSwbnwt2PRZEsPDUQwm34hLOVa+Sg1+VH+6+vPtlOrS/RyAij+mKZSV
 1GETJDzqIepVzmS9/6sSDYq7l1JmyGBiUcM8oT9yUiLlVJDuDstFBNZETMWj/fGlhV0k
 4dfnqwWOkol+A5yfWDHecHZt8ouKUbiz9rKTyKNavECUlRqJgO22XehRFysEd4nkTXGU 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxsbxqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 14:39:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8129410002A;
 Wed, 27 Nov 2019 14:39:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78ECF2B9913;
 Wed, 27 Nov 2019 14:39:31 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 14:39:31 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 27 Nov 2019 14:39:31 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3 12/15] stm32mp1: activate SET_DFU_ALT_INFO
Thread-Index: AQHVgmD84LVvnd5HIkWm+3W2UK7CdqefS1ig
Date: Wed, 27 Nov 2019 13:39:31 +0000
Message-ID: <468558165be449f694f8f84f4778efd4@SFHDAG6NODE3.st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
 <20191014072812.21843-13-patrick.delaunay@st.com>
In-Reply-To: <20191014072812.21843-13-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 12/15] stm32mp1: activate
	SET_DFU_ALT_INFO
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
> Sent: lundi 14 octobre 2019 09:28
> 
> Generate automatically dfu_alt_info for the supported device.
> The simple command "dfu 0" allows to start the dfu stack on usb 0 for the
> supported devices:
> - dfu mtd for nand0
> - dfu mtd for nor0
> - dfu mmc for SDCard
> - dfu mmc for eMMC
> - dfu ram for images in DDR
> 
> The DUF alternate use the "part", "partubi" and "mmcpart" options to select the
> correct MTD or GPT partition or the eMMC hw boot partition.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

-- 
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
