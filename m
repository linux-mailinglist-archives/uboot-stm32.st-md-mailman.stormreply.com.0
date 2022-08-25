Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520F5A09DB
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Aug 2022 09:20:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D55C5EC6B;
	Thu, 25 Aug 2022 07:20:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66312C08D1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 07:20:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P4BE4Z022596;
 Thu, 25 Aug 2022 09:20:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=x+IQiUCzflB25cXi1R/mj/CeYajZ1OQ0HQwJgbsfh0Y=;
 b=rdGqe2nZDIDb+dZuKlIiiUB5Ly7lTiKHEn/pab4Plx0EcarviN551b3a6CJOT9AS9zvV
 p7G4jnTFcEDYZuMHsijH6Y/mtJy2VnJHw9lijWmIXvoT70esSvuJ9C7WbOrwX3xdRxqr
 p3J5t5B3NKwFlS7t7QGBajBymZlxCyt9aZ6vrvBn/ANiriLbVnVXW9/SoH1EljLBlQ4Z
 IxsFHuRuYpM8+LWW30lcf7B7sgIcaxTgSu16oq4MenrDYr61MPGgaoEWgDASL5A4Xe9/
 TMh4z0xfvdH26nktDXPR1E8h4T7V0ZT6ZLA6tLo4Uux30L0RnRC1an2lSAPZ1JJM9cBA MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j58m5hbc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 09:20:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2DB210002A;
 Thu, 25 Aug 2022 09:19:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD95C215156;
 Thu, 25 Aug 2022 09:19:59 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 25 Aug
 2022 09:19:59 +0200
Message-ID: <bda584a7-7bb8-5b05-8779-0a1ba9d9a8f9@foss.st.com>
Date: Thu, 25 Aug 2022 09:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20220824150659.1117510-1-patrice.chotard@foss.st.com>
 <YwZlOysJm4st3Mtc@nx64de-df6d00>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <YwZlOysJm4st3Mtc@nx64de-df6d00>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_03,2022-08-22_02,2022-06-22_01
Subject: Re: [Uboot-stm32] [PATCH] configs: stih410-b2260: Fix SYS_HZ_CLOCK
	value
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

Hi Grzegorz

On 8/24/22 19:51, Grzegorz Szymaszek wrote:
> Hi,
> 
> On Wed, Aug 24, 2022 at 05:06:59PM +0200, Patrice Chotard wrote:
>> SYS_HZ_CLOCK was wrongly set to 1MHz whereas it's set to 750MHz
>> by default by bootrom.
> 
> s/1MHz/1GHz/, it seems. Otherwise:

I confirm ;-), i sent a v2 with your reviewed-by and this fix.
Thanks

> Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> 
> 
> All the best
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
