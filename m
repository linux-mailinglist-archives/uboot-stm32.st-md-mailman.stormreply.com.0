Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C5426B98
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 15:20:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37FF3C5719E;
	Fri,  8 Oct 2021 13:20:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70BA7C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 13:20:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198Cck2H002687; 
 Fri, 8 Oct 2021 15:20:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=urtFklAAZroTKJ/6MPpQc83wn86YZeaUUMXfe2/oHOM=;
 b=AH5sm6dQUeHygN9QZyyq82VIZacCzvLyFD5fDTfIkEjsvQJF6KqHumEAdqn414s0r9j5
 MoE1NgEKKYDdzHlfFRPqVpEvM80elAhyudqxACSN1gXM9GV437RGkW+9gcKtS1fps0fN
 BPCbIaTrFz+Z/vSfjFswFrkTvXDaRYi7exzcmfRVP728NfGt2mudOUOh8ZeNaXsLaCbS
 2ilw98iatsnb6IsaVhu4TR33fdVzhs1eCEAFl8bTzZqgrh1ZABvk/HBZ1t1ngfp7eKb3
 Vwh7OaP1EeBZLHB+pcCuKqYgWpAtG/NTlfrAPfFyT6Xe17YDYW0JlpTSy9MsOqZGCkKK Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjp6206rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 15:20:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62B4610002A;
 Fri,  8 Oct 2021 15:20:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 552F622D610;
 Fri,  8 Oct 2021 15:20:34 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 15:20:12 +0200
To: Marek Vasut <marex@denx.de>, Alex G. <mr.nuke.me@gmail.com>,
 <u-boot@lists.denx.de>
References: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
 <f517fc64-f8e2-f722-40f0-174bf709c145@foss.st.com>
 <ccf4d20e-907f-02f4-aafc-e6c75f0932a5@gmail.com>
 <27a421f4-15f1-f164-a7d3-fe6091436478@foss.st.com>
 <89864188-72a4-ecfc-5933-896a46f40b2a@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <169621fd-a312-e07d-ae14-6683124e39e5@foss.st.com>
Date: Fri, 8 Oct 2021 15:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <89864188-72a4-ecfc-5933-896a46f40b2a@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_03,2021-10-07_02,2020-04-07_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH 0/3] stm32mp: Attempt to resolve
 unintended breakage with v2021.10-rc2
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


On 10/8/21 1:28 PM, Marek Vasut wrote:
> On 10/8/21 11:18 AM, Patrick DELAUNAY wrote:
>> Hi Alex,
>
> Hi,
>
> [...]
>
>>> Without loss of generality, any CONFIG that conflates u-boot options 
>>> with SPL options is likely to cause some changes down the line.
>>>
>> I have a issue today with the generic part of ARM support:
>>
>> 1/ the PSCI is mandatory for Linux kernel
>
> PSCI is mandatory only on ARMv8 , NOT on ARMv7.
> And the "mandatory" part is forced onto everyone not by Linux kernel, 
> but by the architecture specification.
>
> [...]


Sorry for the short-cut... it is not really manadatory.


Today PSCI is required by the upstreamed Linux kernel on STM32MP15x 
Family to wake-up the secondary core and some other features (system 
reset / power-off).


STMicroelectronics decided to use the Power State Coordination Interface 
(PSCI) on all the STM32MP SoC (armv7 or armv8) even if PSCI it is only 
required in AArch64 for Embedded Base Boot Requirements (EBBR) Specification


https://arm-software.github.io/ebbr/index.html#document-chapter3-secureworld


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
