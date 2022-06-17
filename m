Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE854F412
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 11:17:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AEDBC5F1F2;
	Fri, 17 Jun 2022 09:17:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26902C5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 09:17:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6xrsf005197;
 Fri, 17 Jun 2022 11:17:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ImhSHO27JlfdQaOH7w/BH/C08l7cIdFVzpWtqH1ZBZ4=;
 b=u9p10aFljC88pYD3cfF91OYXLxIOggGJyJ3PuuB8GmxtS6iRzhEwpYJIl4xfP4lHN7Zp
 FMypFxATO/pY5CzJtT0u6PoU52eP8mTNRaNHYW4/izi3Kk3GmlhJfdrraPW93quJB4mA
 2T5ipiI5mPLoRygPftkPTUmvNHZ/Sd/BqOGuZy28Y+gOo///L2MbHhi30VabE9sMqRsW
 jSM4RCVNfJyF0SlrU6VKpQXQYV+23xahTqFslc6Tuo9czf6gi6bqd+zI9riNFbHInaGm
 DkouC0Myb+BO7Tjl3OO+l2eZfZifqBE2TdFTDWQ7ecxTKz2ND8IyHrJNGXPrBqAIzm41 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmu98u2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 11:17:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3923100039;
 Fri, 17 Jun 2022 11:17:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFE1D21B505;
 Fri, 17 Jun 2022 11:17:55 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 11:17:55 +0200
Message-ID: <1918ce83-8dd4-9d47-d035-f90219c700a6@foss.st.com>
Date: Fri, 17 Jun 2022 11:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220615194135.v2.1.I9cc1b8d493af70f2d448bea518372ab7c29afc50@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220615194135.v2.1.I9cc1b8d493af70f2d448bea518372ab7c29afc50@changeid>
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp: cleanup the
	stm32mp15 file
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

On 6/15/22 19:41, Patrick Delaunay wrote:
> Remove STM32_SYSRAM_END and clean the comments in stm32mp15_common.h file
> after moving some CONFIG to Kconfig: CONFIG_SYS_CBSIZE,
> CONFIG_SPL_MAX_FOOTPRINT, CONFIG_SYS_SPL_MALLOC_START and
> CONFIG_SYS_SPL_MALLOC_SIZE.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - remove the define STM32_SYSRAM_END, no more used
>
>   include/configs/stm32mp15_common.h | 11 -----------
>   1 file changed, 11 deletions(-)
>

Applied to u-boot-stm/next, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
