Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8B51C31B
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 May 2022 16:58:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4E7CC5F1F1;
	Thu,  5 May 2022 14:58:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29B2FC5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 14:58:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245DjY6b018222;
 Thu, 5 May 2022 16:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Aeayma1Pm9PzULiYHdlSUYfxZvKYhmI72L7g4YUr8QA=;
 b=pjkQyGxwLINEn5sk7nnxdLhZfJNFFuZfdAkEopRs7JT3KTbJrGkX6zlRBm9VvX9oFu+Y
 dRLQ3XzhhGEbhNYtF+0rvRI9sJ3x58GxKYbiM+SBM8kGpvUuI0OVa/rdQNLhHENwOwVi
 UiuZk38qMZizmpQuXT/43uUBJqRlC9DbijzoVgRdroHi9J84xnGwQVaLvLqZp5dlNNWM
 57poaOnMLYNaO/FvHZR4cg5sXC0awzGxRFYP8GX1YimOLbJRFi14L8q2r+9JB9lIuNod
 gW9gvjKNHxwqzWnp5hCdywblV3yMjmUfJFt/D2c19xW+HZ9wstRGw1cBg3WDWOJiINvB Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthk33fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 16:58:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3711C10002A;
 Thu,  5 May 2022 16:58:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30475226FDA;
 Thu,  5 May 2022 16:58:31 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 5 May
 2022 16:58:30 +0200
Message-ID: <2b6917f2-6294-d12a-9229-78b247dac3d2@foss.st.com>
Date: Thu, 5 May 2022 16:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20220505151756.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
 <20220505151756.2.Ic4641ddc829feecc12b775615bd175f3f35c3ea9@changeid>
 <3a7461a5-9796-8424-07d6-688e37bfa36f@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3a7461a5-9796-8424-07d6-688e37bfa36f@denx.de>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_06,2022-05-05_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] usb: host: ehci-generic: Remove
	DM_REGULATOR flag
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

HI Marek

On 5/5/22 15:45, Marek Vasut wrote:
> On 5/5/22 15:17, Patrice Chotard wrote:
>> Currently, DM_REGULATOR flag is no more needed to protect no DM core,
>> remove it.
> 
> DM_REGULATOR flag is actually Kconfig symbol.
> 
> Why is it no longer needed ? (answer should be in the commit message)

Ok, i will update the commit message as following :

Since commit 16cc5ad0b439 ("power: regulator: add dummy helper")
regulator dummy helper are always available even if DM_REGULATOR 
is not set.
DM_REGULATOR flag is no more needed to protect no DM core,
remove it.

Is it OK for you ?

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
