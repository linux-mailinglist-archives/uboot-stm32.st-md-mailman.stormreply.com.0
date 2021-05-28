Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5661394313
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:59:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99A44C5718D;
	Fri, 28 May 2021 12:59:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F589C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:59:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCqLNm013195; Fri, 28 May 2021 14:59:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wWECsEmyiUP9TJ7oqpP1OJlkVx30v/7NRL3OEVVVrdg=;
 b=S7m+mG0lzOglWJhQ+P/D8aRc3zEaQhVRdpE7Gk1qm+uO9QmwhJHQNVRPfFsjCHUi5af9
 oMUyzgxSaYF4knsmV6bovYUxvREO56q/ZHQcEhcQa90uZ6TyUW1fq2Vr+Zb+wow8Dq4Z
 4/ksWhq8txLm5Yta+SdfvUMAf7yA0chFN9mk1Z1hzGwGYC+SaP0GdhlYHnkFGSbija1W
 mLZA9GoxN1cDz/IDxiYsn3YErtlhRFl1l8cvRH1AwxlWd/k5Vyjvm2R72FAhM1oHqhyU
 QQtF7GY6klXnS6ODGEdunztVfGCsCohbkXUXhj8qq7rrErM6pwSLQeuXS4xF8c86IZgp JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tsq0jjjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:59:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D911910002A;
 Fri, 28 May 2021 14:59:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D05852291DD;
 Fri, 28 May 2021 14:59:17 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:59:17 +0200
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
References: <20210506093041.1.I0019059e1020cfe0079e48d563acf59c0d6f0a1e@changeid>
 <66ade021-9761-564e-0c11-132ed513f28a@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <35343dbd-3924-3d56-18f7-7194ced8e7cc@foss.st.com>
Date: Fri, 28 May 2021 14:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <66ade021-9761-564e-0c11-132ed513f28a@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp: Enable UNZIP on
 STMicroelectronics stm32mp15 boards
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

On 5/28/21 2:46 PM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 5/6/21 9:31 AM, Patrick Delaunay wrote:
>> The CMD_UNZIP provides the 'gzwrite' command, which is convenient
>> for writing e.g. gz-compressed images to eMMC from U-Boot.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   configs/stm32mp15_basic_defconfig   | 1 +
>>   configs/stm32mp15_trusted_defconfig | 1 +
>>   2 files changed, 2 insertions(+)
>>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
