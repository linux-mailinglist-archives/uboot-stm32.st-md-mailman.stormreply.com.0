Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C262C3D15
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:58:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EF92C32EA3;
	Wed, 25 Nov 2020 09:58:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6A47C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:58:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9q5K2009539; Wed, 25 Nov 2020 10:58:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VCzoUPchjgHBUIlP0x/hdr/5Wt0qMffxU7A8oQq+k94=;
 b=L0vDKHGdV1L8upQAdU9yQhotXRrGlAcHM2PMHrqPz7lk8hoj/n7QroezhaETdnJYqGtw
 HAzU2zMx6NutUNH6QJOPDReRAfrSSLPfy+yjrcqkSclQbgJd8qHTW2hLxoX+ZkrdZjVY
 b1ieeomIrgnIcEf51XbOutdrH9OrcnoEw/ggHMzau5AEF2+VDFDLveivz0nwbLqW4arg
 NtioXW+gv8kX2deu/vIWFkL4gSEwHZ72izfYbaioa7IIbWd+nd/fqJb627NX/0ta5VC4
 kQkPSjSZSNveLltxfrjvWUb7VyqbND4UbO5LL8Wh31WsQ9DZGJ7uOwkt5ClTtuprqy1y Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01cn4xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:58:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EC43100034;
 Wed, 25 Nov 2020 10:58:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83909231F9A;
 Wed, 25 Nov 2020 10:58:00 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:58:00 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:58:00 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: stm32mp1: no MTD partitions fixup for serial boot
Thread-Index: AQHWovIMulAZleopSEmzvDjZLLL406nY3OcA
Date: Wed, 25 Nov 2020 09:58:00 +0000
Message-ID: <7c682695631347b8a4552d7fea13d2ed@SFHDAG2NODE3.st.com>
References: <20201015125230.8378-1-patrick.delaunay@st.com>
In-Reply-To: <20201015125230.8378-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: no MTD partitions fixup
	for serial boot
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
> Sent: jeudi 15 octobre 2020 14:53
> 
> Remove the update of the MTD partitions in kernel device tree for serial boot
> (USB / UART), and the kernel will use the MTD partitions define in the loaded DTB
> because U-Boot can't known the expected flash layout in this case.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
