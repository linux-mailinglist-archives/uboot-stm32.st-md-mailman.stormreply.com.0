Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E044C4C0
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Nov 2021 17:00:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63DB6C5EC71;
	Wed, 10 Nov 2021 16:00:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF273C5EC6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 16:00:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AAFFQ7f007049;
 Wed, 10 Nov 2021 17:00:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vnRJPFuZVwepDPuH1nSB2i1mfx+c3akw5YNWPWg7xs4=;
 b=H6xK0jLbAPNmQF1f3MAfUDDKXvvW3yxnRRiWDMoCKEpbjemVApaAK0fG3xjrhqkX6MOb
 MbHomMIuxQoZQe3glfhRr+akXnunPEMR3eym4BPFqdpwEEoUtrO8d/dPA8txuMcXfAGY
 kB2OHj24rIVLAlSYnfMKKnCw/mGPDVKn7qfGo9ScYgVlCbnmQ4OB1WqRmrkLwDLSWbeu
 oG1Nvc/rb9x5cQzTY0+wsCiy06jkKDXL84fNVTV9f7YUM/g0bwOHwxJWOTCaF94jL80o
 WIdY42I/8Qu5x9C77UD2vYWP6dAfpIx/UAlK1y9+fkejZ/ctLP0a9mYIUt3Zbv8Hrc1O 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c8gjj885f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 17:00:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7351C10002A;
 Wed, 10 Nov 2021 17:00:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51780209F65;
 Wed, 10 Nov 2021 17:00:12 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 10 Nov
 2021 17:00:10 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211022201136.1.I9077efa33ed992563301acb5a5534326a3f3d289@changeid>
 <b31a4337-7bc1-b83d-741f-2c2f3e1c04bd@foss.st.com>
Message-ID: <185718fe-b148-3296-c29a-4bf415d74d61@foss.st.com>
Date: Wed, 10 Nov 2021 17:00:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b31a4337-7bc1-b83d-741f-2c2f3e1c04bd@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_06,2021-11-08_02,2020-04-07_01
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] gpio: stm32: create include file for
 driver private data
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

Hi Patrick

On 10/25/21 8:43 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 10/22/21 8:12 PM, Patrick Delaunay wrote:
>> The stm32 gpio driver private data are not needed in arch include files,
>> they are not used by code except for stm32 gpio and pincontrol drivers,
>> using the same IP; the defines for this IP is moved in a new file
>> "stm32_gpio_priv.h" in driver/gpio.
>>
>> This patch avoids to have duplicated file gpio.h for each SOC
>> in MPU directory mach-stm32mp and in each MCU directory arch-stm32*
>> and allows to remove CONFIG_GPIO_EXTRA_HEADER for all STM32.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied on u-boot-stm/master 
Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
