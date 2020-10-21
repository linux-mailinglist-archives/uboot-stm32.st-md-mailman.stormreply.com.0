Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ADF294DD4
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 15:46:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E228DC424B9;
	Wed, 21 Oct 2020 13:46:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18030C424B3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 13:46:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LDg55e004397; Wed, 21 Oct 2020 15:46:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=KSC9FmgnIc7sIQQ5EkP0OLPhIjT/o8nYGXT2zGsDd68=;
 b=av9STfdbdgx+zLSrGnCdRcU+T7gbNGfH0SqTwsTbxt7Kitzfi111p52mWdPz7jCqp+lT
 9s+N9poZt3eWFejqNhtbfiU7/9q0KBfVAgLJNJautwWCwVDBqA4Iw5oLFhprAkZzm//B
 HjYNHdY7/5N26PJsBpiKBIUASqmISIa4Kedv/lxClo6RM6llrEau+ZdgznD9IBA0Ujjx
 KlVC0peQv3mQdkXVOoYuZLRY0/oUzZvHqpqUrNHoQ2wSLC1DKA7Blhh7DgpEXEONEQJC
 GFR5PfG23m/PSlsdXDle7Vdj4/SxCNx6HVuX/HYoIaKFoVl5cH9ltT/mbA7Rlg7weuEf GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347p30thu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 15:46:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EE55100066;
 Wed, 21 Oct 2020 15:44:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65FF12D92A0;
 Wed, 21 Oct 2020 15:44:05 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 15:44:04 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 15:44:04 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: stm32prog: accept device without partition
Thread-Index: AQHWou6rIbT+uP58dkm9+dytYNpLp6miGoAw
Date: Wed, 21 Oct 2020 13:44:04 +0000
Message-ID: <80ffb1a8518c4ee1baa358985e4978bb@SFHDAG2NODE3.st.com>
References: <20201015122817.18234-1-patrick.delaunay@st.com>
In-Reply-To: <20201015122817.18234-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_06:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: accept device without
	partition
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
> Sent: jeudi 15 octobre 2020 14:28
> 
> When partitions are not available on a device the command stm32prog raises an
> error but a device can have no partition to check in init_device() and the command
> need to continue to the next part_id.
> 
> This patch correct an issue for ram0 target, when block_dev and mtd are NULL.
> 
> For example with the simple flashlayout file:
> 
> Opt	Part	Name	Type	Device	Offset	Binary
> -	0x01	fsbl	Binary	none	0x0	tf-a-serialboot.stm32
> -	0x03	ssbl	Binary	none	0x0	u-boot.stm32
> P	0x10	kernel	System	ram0	0xC2000000	uImage.bin
> P	0x11	dtb	FileSytem	ram0	0xC4000000	stm32mp157f-
> ev1.dtb
> 
> Fixes: ffc405e63b94 ("stm32mp: stm32prog: add upport of partial update")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
