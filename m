Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 177866E74B1
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 10:11:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F2A4C6B460;
	Wed, 19 Apr 2023 08:11:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5956EC6B456
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 08:11:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J3RQ3n001533
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 19 Apr 2023 10:11:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6QnT3A96La6JrLN8iuopYYk+0JPuk55TJw3fk6hkevA=;
 b=xtxtDXhJcmOphxvot7k/8I6nvXH4Li9YHns5nRqve5UF/V0CQFHBxccPNFRCLXDavXkc
 DEPt5pTa9ZyHQhpCydDHjkgrmDJnVS+cSfWAqyFWwTu9Tcp4N/2o9LISk3ZD7IGuX229
 qcQAx/Wq5sH1Lw+RjjA2Qd1a9mH3c6IzLoYBKSyYkBg/cJv3/wAhwqa6ALlEMMFUtwXS
 LVwiZlvZiA4b4pMS3jDLNhwA8JrlB+F/+mRf2CNqTJ0xVZvOJ7cSFctt1kW8+gf7KEY2
 e45L4/rcBfGCtvBXLo9VXdxGi1W+E9kbk2Na9IXi2rGI3aoFMIA55Mq/uRXcFZQBb8nh kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1rq2etfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 19 Apr 2023 10:11:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EDC7100034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 10:11:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5615A212301
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 10:11:26 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 10:11:25 +0200
Message-ID: <48449221-e060-21ca-94aa-c4ddc9af02e6@foss.st.com>
Date: Wed, 19 Apr 2023 10:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
 <20220909114513.v2.2.I70caefeb79d8d2f6c1682d6ecedc48a4ea9ef3e4@changeid>
 <d7cc7dac-01ad-fcdb-db47-711817ea3cf4@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <d7cc7dac-01ad-fcdb-db47-711817ea3cf4@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_04,2023-04-18_01,2023-02-09_01
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] configs: stm32mp15: set
 CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2s
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



On 9/26/22 09:07, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 9/9/22 11:45, Patrick Delaunay wrote:
>> With some USB devices connected on USB HUB for the STMicroelectronics
>> boards, set the usb_pgood_delay=2 is not enough to ensure a correct
>> detection for all cases; but it is solved with USB_HUB_DEBOUNCE_TIMEOUT=2s.
>>
>> For example, issue encountered with the USB flash disk:
>>     ID 058f:6387 Alcor Micro Corp. Flash Drive
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> Changes in v2:
>> - force CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2s for stm32mp15 defconfig
>>
>>  configs/stm32mp15_basic_defconfig   | 1 +
>>  configs/stm32mp15_defconfig         | 1 +
>>  configs/stm32mp15_trusted_defconfig | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
>> index 33680dc25e9..efb506c1172 100644
>> --- a/configs/stm32mp15_basic_defconfig
>> +++ b/configs/stm32mp15_basic_defconfig
>> @@ -46,6 +46,7 @@ CONFIG_SPL_POWER=y
>>  CONFIG_SPL_SPI_FLASH_MTD=y
>>  CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
>>  CONFIG_FDT_SIMPLEFB=y
>> +CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
>>  CONFIG_SYS_PBSIZE=1050
>>  CONFIG_SYS_BOOTM_LEN=0x2000000
>>  CONFIG_CMD_ADTIMG=y
>> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
>> index fd2a5de8d13..ba87b511974 100644
>> --- a/configs/stm32mp15_defconfig
>> +++ b/configs/stm32mp15_defconfig
>> @@ -22,6 +22,7 @@ CONFIG_FIT=y
>>  CONFIG_BOOTDELAY=1
>>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>>  CONFIG_FDT_SIMPLEFB=y
>> +CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
>>  CONFIG_SYS_PBSIZE=1050
>>  CONFIG_SYS_BOOTM_LEN=0x2000000
>>  CONFIG_CMD_ADTIMG=y
>> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
>> index 1154eec210c..6644ea4c81f 100644
>> --- a/configs/stm32mp15_trusted_defconfig
>> +++ b/configs/stm32mp15_trusted_defconfig
>> @@ -23,6 +23,7 @@ CONFIG_FIT=y
>>  CONFIG_BOOTDELAY=1
>>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>>  CONFIG_FDT_SIMPLEFB=y
>> +CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
>>  CONFIG_SYS_PBSIZE=1050
>>  CONFIG_SYS_BOOTM_LEN=0x2000000
>>  CONFIG_CMD_ADTIMG=y
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Applied on u-boot-stm/master, thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
