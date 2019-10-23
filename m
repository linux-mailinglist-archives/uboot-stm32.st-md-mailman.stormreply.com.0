Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD6E16E6
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 11:57:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AA05C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 09:57:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2389C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 09:57:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9N9u9tW000738; Wed, 23 Oct 2019 11:57:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=e+Riv9/AlGwMIgR3p0Xk5dbvT4FS4soIbznouHfC5rc=;
 b=S89cA31gk7x4Z114HfEqlXLJSCiWqlpinpuFzX2Z0loN70dEP1wr58TOW1Yjl4gUfw7l
 HgjIU0DwB0sP+vOjs2Q+K/DQq0ZsE6NN/YIz9F3JOzmM6yfqNK7ukAYcS6MtqjX5nMoE
 lhXkHs8uwjFre5gRLcR14b2tqDLJwRqMyVz2g/ed22WVNUX/YWildgn5yCecumoeILqG
 wnrQ6CSwE7CJjD1hYZugLd95aVIzEWXbDJYmHiUjBek7kAq/2ZNZGJln1DYcZaTNklJF
 7pWetPL+efEkdZLWiCw4OuPbR7JUWcGmHBQv4YDhSChNqqN4AKxcC8WqdZVpKEdxHedU AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4tvw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 11:57:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B135F100039;
 Wed, 23 Oct 2019 11:57:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7DC32B6847;
 Wed, 23 Oct 2019 11:57:50 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 23 Oct
 2019 11:57:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 23 Oct 2019 11:57:50 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: stm32mp1: fixup the usb product id for USB
 download gadget
Thread-Index: AQHVajaPJIAYSu0/tE2bXHKCubOnF6doO9vA
Date: Wed, 23 Oct 2019 09:57:49 +0000
Message-ID: <fcfeb21a4f3c4a40ae394213617e7f29@SFHDAG6NODE3.st.com>
References: <20190913132417.19206-1-patrick.delaunay@st.com>
In-Reply-To: <20190913132417.19206-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_02:2019-10-22,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: fixup the usb product id
 for USB download gadget
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

> 
> Select the correct USB product id used by the download gadget for ST stm32mp1
> boards.
> 
> The board stm32mp1 select the correct product id, as defined in http://www.linux-
> usb.org/usb.ids for the STMicroelectronics vendor id = 0x0483
> (CONFIG_USB_GADGET_VENDOR_NUM):
> - dfu = 0xdf11 : STM Device in DFU mode
>   it is the value used by ROM code and reused for stm32prog
>   command
> - fasboot = 0x0afb : Android Fastboot device
> - others = 0x5720 (CONFIG_USB_GADGET_PRODUCT_NUM)
>   Mass Storage Device
>   it is used for UMS command / usb_dnl_ums
> 
> This patch avoid conflict when the same USB VID/PID is used for ums, fastboot or
> dfu command (two different protocols associated to the same PID).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
