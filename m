Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE2C3FFBEE
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 10:28:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49238C597AC;
	Fri,  3 Sep 2021 08:28:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2AD8C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 08:28:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18377KXW029751;
 Fri, 3 Sep 2021 10:28:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SyEbhCfyH4rqCEfSck/WwBndn7eia5PUm/OPXa1gIIQ=;
 b=tzet/x5KYXqYd2hCcQ2pquilu2CV8ZkTNUk6hse05lFjyZCgLndNWxQ7ExwldJElgoX1
 QYdCBtkel9P9eUoNUKl0dKFFSAjZ/9GdBnpDrjbL+iUkzJNi/n8xtiskqKy3mqC5Ah2c
 8+ydWpJcr4/Cuas/NEaExew/yqvc4IOCVSkg2gW2wZXemjANh75qQn4pqkS4IRqRbGXi
 OpjBUmOs93BnAj130rImsK7FwNHdejJotzRIGCv/atVkbNFjbMooeJMmJhYvaLSYxjl0
 1fTALRzjc3r9qwCPKSFe8bI9/xe4eLfFAGmgVMMAyIikXPxAhZy1NfFvU8totKD98E4u Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3auf1r0gy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:28:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C0DB10002A;
 Fri,  3 Sep 2021 10:28:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79D002138FF;
 Fri,  3 Sep 2021 10:28:12 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep
 2021 10:28:11 +0200
To: Tom Rini <trini@konsulko.com>
References: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
 <20210902131239.GV858@bill-the-cat>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <4fa61af4-779b-c86c-65a2-fdf3064a73f2@foss.st.com>
Date: Fri, 3 Sep 2021 10:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902131239.GV858@bill-the-cat>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-03_02,2021-09-03_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 dillon min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] arm: stm32: Disable ATAGs support
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Tom,

On 9/2/21 3:12 PM, Tom Rini wrote:
> On Thu, Sep 02, 2021 at 12:02:06PM +0200, Patrick Delaunay wrote:
>
>> These platforms never had to support an ATAGs-based Linux Kernel, so
>> remove the options.
>>
>> Cc: Marek Vasut <marex@denx.de>
>> Signed-off-by: Tom Rini <trini@konsulko.com>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> Hi,
>>
>> this patch is a rebased version of the STM32 part [1] of Tom's patchset =
[2].
>>
>> I also update the new file include/configs/stm32h750-art-pi.h
>>
>> [1] [13/13] arm: stm32: Disable ATAGs support
>> https://patchwork.ozlabs.org/project/uboot/patch/20210204022415.20589-13=
-trini@konsulko.com/
>>
>> [2] arm: nanopi2: Remove unused code
>>      https://patchwork.ozlabs.org/project/uboot/list/?series=3D227910&st=
ate=3D*
> Note that I've posted
> https://patchwork.ozlabs.org/project/uboot/list/?series=3D260161&state=3D*
> recently and that includes this change.  2/2 of this series is good to
> see.
>

It is noted.

and I also=A0 propose a cleanup the code with CONFIG_SUPPORT_PASSING_ATAGS =

introduction:

"arm: use CONFIG_SUPPORT_PASSING_ATAGS"

http://patchwork.ozlabs.org/project/uboot/list/?series=3D260843&state=3D*


regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
