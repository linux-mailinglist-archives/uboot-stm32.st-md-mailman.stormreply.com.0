Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB25F3CD8
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Oct 2022 08:44:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19D39C63327;
	Tue,  4 Oct 2022 06:44:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95043C5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 06:44:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29409eSb022263;
 Tue, 4 Oct 2022 08:44:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q6rV8BZy20H4m989hVJYhRZLcHfZjrhasoXWVAM7VkU=;
 b=UAcjTnr2/KfqaO1WJb9fsRnkidk3H0dA6U/v4voL+G2bSmkZ6iNGMZ+9LjE/b3VZWeq9
 n7mjBCWdiOOAzf2OFswijeEP2CdU14ZcsG57HPqKvJ97JLbFsCKWP7nxu7SkDltJspg0
 Ab4oNEOI/X5rrfJDMudJh/aNzAIHm5Hby4cCHtC3M+WQMLBTaKAcCCGzs94F2jOLWRIr
 k+/hXb+vTt/b+oAUDWjGDJgo0PDQ3wtNyxoYMKirIl3Dlu4BWHJDB6dyKuE/3O3UR6fk
 H4nBsVPQihh9Je0P+EJ0pwZaC9JluuSxKgDR3GrpprD+o1TprX6XFW/5M9ta2TTo2/Jo mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jxapbxfxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 08:44:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 205F7100039;
 Tue,  4 Oct 2022 08:43:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 076512122FA;
 Tue,  4 Oct 2022 08:43:56 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 4 Oct
 2022 08:43:55 +0200
Message-ID: <49e332f0-afe7-59ba-675f-fcee80e651eb@foss.st.com>
Date: Tue, 4 Oct 2022 08:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
 <b16b2fce-a72d-aa5f-a426-d445d0dc7cbb@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b16b2fce-a72d-aa5f-a426-d445d0dc7cbb@denx.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_02,2022-09-29_03,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v1 0/4] phy: Add generic_{setup,
	shutdown}_phy() helpers
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

Hi Marek

On 9/7/22 01:03, Marek Vasut wrote:
> On 9/6/22 08:15, Patrice Chotard wrote:
>>
>> In drivers ehci-generic.c and ohci-generic.c, specific phy
>> helpers has been added and shared 95% of common code.
>> Factorize this code in generic_{setup,shutdown}_phy() helpers
>> and update all consumers.
> 
> Entire series
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

Just a gentle reminder as you have reviewed this series, but it has not been merged into next branch.

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
