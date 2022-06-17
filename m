Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC7154F40E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 11:16:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA4FBC5F1F2;
	Fri, 17 Jun 2022 09:16:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49A32C5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 09:16:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6RGQm029141;
 Fri, 17 Jun 2022 11:16:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NY4oYUFlUbFbKX3rpYHMIkAjUYQU+bN/uq8UtVzIQvs=;
 b=Vp/K4Bdc4UPk+jmGOc0ui87s9W/oVriwXGLBrLJnoJs335gyoYk/CzEGvIbNfxoGjlf3
 rLjW1ja5L00BJsWMn/M0NwEkfrKVreYoZu5bZx7O7ufxZCkBRWhG2KleqlxRcOJQIdTF
 WBpArUV+qFDqJwNbC6sgPRjQam9p+9RJ4maT6skZj1o8qq+NULurpIUxaDz5mJuiw7GB
 hQeXyq4iVXgfNHxzu+AZk+ixOJCWbIzZ3sRvjt9PogmG73MLOXADMEoOnsJaaAhXbAQ0
 VDRvbdW0zRpP4LiHDUA9fWbfPt+S0yto87RccSt8hKX+yvEY5ut4CvOGDfWRIjjjMUL9 IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmbw10w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 11:16:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A44B100034;
 Fri, 17 Jun 2022 11:16:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 134FE21A23D;
 Fri, 17 Jun 2022 11:16:54 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.117) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 11:16:53 +0200
Message-ID: <ccb143dd-7612-6b1f-0481-7f82911e5f0b@foss.st.com>
Date: Fri, 17 Jun 2022 11:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220601183338.1.I50f3ce7fb4a4bb3169f40cf4bab0ec75936e5c03@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220601183338.1.I50f3ce7fb4a4bb3169f40cf4bab0ec75936e5c03@changeid>
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stpmic1: remove the debug unit
 request by debugger
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

On 6/1/22 18:33, Patrick Delaunay wrote:
> Depending on backup register value, U-Boot SPL maintains the debug unit
> powered-on for debugging purpose; only BUCK1 is required for powering
> the debug unit, so revert the setting for all the other power lanes,
> except BUCK3 that has to be always on.
>
> To be functional this patch requires a modification in the debugger
> ,openocd for example, to update the STM32MP15 backup register when it is
> required to debug SPL after reset. After deeper analysis this behavior
> will be never supported in tools so the associated code, will be never
> used and the associated code can be removed.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/include/mach/stm32.h |  1 -
>   board/st/common/stpmic1.c                  | 14 --------------
>   include/power/stpmic1.h                    |  3 ---
>   3 files changed, 18 deletions(-)
>

Applied to u-boot-stm/next, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
