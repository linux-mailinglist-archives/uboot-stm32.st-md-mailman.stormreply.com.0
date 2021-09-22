Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D4C41432F
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 10:02:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B006CC5A4CC;
	Wed, 22 Sep 2021 08:02:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05EF4C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 08:02:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M6jMX4030613; 
 Wed, 22 Sep 2021 10:02:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ppu8BQg6aj640FEaUVjN3Kqx5z7QIaqQHdAc3/hwQy4=;
 b=Bs35IWbCDYlU3uFuizuSQHpuFcd8r0ZOIQPyPBk7DHBxbxdKuNyR9VOErUtHJ0hwjvoT
 qZKSmE5fyF1JnMhncPMZQl47KgRW35/fLNszcDleTeeZuMVwXQRp4QXhQ5yuHZJL1Pmn
 UHPxAlVKOQEINnlM/EdYiEb4Eho1HYSH0Rzs0pNCNtH8+xa0/GZ4YemO43gV56NRZcCP
 1Dsb8NXh3wAbfMGckfWTWMud4wmP6NGy46BLlsMz7g+N/8uDSn5JINxBxmdNh8oA2iS9
 iHYbOvvWYbHyMla+5qSz2WrMptu29oZlXEE749ggvdWW40nEVa+lc09aJZ1PR/SEGeun cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b7q3tth8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 10:02:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FD1F10002A;
 Wed, 22 Sep 2021 10:02:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0038B21ED31;
 Wed, 22 Sep 2021 10:02:18 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 22 Sep
 2021 10:02:18 +0200
To: Tom Rini <trini@konsulko.com>
References: <20210921183600.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
 <20210921183905.GI8579@bill-the-cat>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <3856272a-892d-c8c6-e197-fbe6fb395963@foss.st.com>
Date: Wed, 22 Sep 2021 10:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921183905.GI8579@bill-the-cat>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_02,2021-09-20_01,2020-04-07_01
Cc: Stefan Roese <sr@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: Migrate CONFIG_ST_SMI to Kconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 9/21/21 8:39 PM, Tom Rini wrote:
> On Tue, Sep 21, 2021 at 06:36:03PM +0200, Patrick Delaunay wrote:
>
>> Use moveconfig.py script to convert the define CONFIG_ST_SMI to Kconfig
>> and move this entries to defconfigs.
>>
>> Before migration, the st_smi.c driver was empty when CONFIG_MTD_NOR_FLASH
>> wasn't activated; it is now managed in Kconfig by the "depends on" and
>> this driver is not compiled.
>>
>> After this patch, the driver st_smic.c is no more used in U-Boot;
>> it was only used in SPEAr products before commit 570c3dcfc153 ("arm:
>> Remove spear600 boards and the rest of SPEAr support").
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> In the first migration process (without depends on) the config
>> CONFIG_ST_SMI was added in bcm7445_defconfig and bcm7260_defconfig.
>>
>> But after adding the "depends on MTD_NOR_FLASH" and a Rsync all defconfig
>> files using moveconfig.py the CONFIG_ST_SMI is also deactivated in these
>> 2 last users:
>> - bcm7260_defconfig
>> - bcm7445_defconfig
>>
>> The U-Boot size don't change for these 2 defconfig (tested with buildman).
> Thanks for doing a migration.  But, since you've found this is dead
> code now, it would make more sense to just delete the driver.
>

Sure, I expected this answer when I see that the driver wasn't no more used.

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
