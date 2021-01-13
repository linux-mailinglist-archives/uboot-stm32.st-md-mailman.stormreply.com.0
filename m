Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75D2F470E
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 10:06:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E319DC424BE;
	Wed, 13 Jan 2021 09:06:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F02C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 09:06:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D95wNQ008982; Wed, 13 Jan 2021 10:06:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : references
 : to : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mA+n1GnDDcTTH8bz6DNYPRgP9VpKdRmyBpKSUspodL0=;
 b=JVJ+wry8q0ct+pHOLMqrVseaOwLR9Gz60a7BCmr7oq26cHln0pXBOcMfLHdYzIF2nRYH
 TLaWivVawIkehKeIeCPtnN9J+UbHYRD6oacRWziO1asv/pHH8XQiEFwpZIJ/hTNAn9no
 OtGBSnPRg0/4WZKRlHWjkZeY4+12c5fLFYhAClcxIwt1NK2vQ70jhlWPQpDEn2tyAW55
 8t+3wlH6pMmQzRB0VDlBjxplQFhnx3dqB7GjMPFI6eB0rHT//kVTM7pqqDxIyB7YAEY6
 fchQnBrUUIjEsDYHtuhEzESkCuu9otGrFtWq1wQeesnhxkz4C5M9b3zDXlT+9bmmy5Kg 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5h2naur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 10:06:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E799A10002A;
 Wed, 13 Jan 2021 10:06:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9475229EA3;
 Wed, 13 Jan 2021 10:06:30 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 10:06:30 +0100
References: <7f3f7576-b62a-e1dd-928e-a1b9611451bc@foss.st.com>
To: <u-boot@lists.denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
X-Forwarded-Message-Id: <7f3f7576-b62a-e1dd-928e-a1b9611451bc@foss.st.com>
Message-ID: <a310d9ae-9a9d-7517-cdff-dc434440fa52@foss.st.com>
Date: Wed, 13 Jan 2021 10:06:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7f3f7576-b62a-e1dd-928e-a1b9611451bc@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_03:2021-01-13,
 2021-01-13 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: stm32: Use firmware property
	instead of loadables
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

Hi Michael

> From: U-Boot <u-boot-bounces@lists.denx.de> On Behalf Of Michal Simek
> Sent: lundi 5 octobre 2020 11:37
>
> There shouldn't be a need to use loadables propertyn because u-boot can be pointed by firmware property. This change should also speedup boot process because loadables property is list of strings which code is going through.
> On the other hand firmware can just point to one image.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
> Changes in v2:
> - Also add dhcor
> - Fix subject typo
>
> Only done based on grepping the code. Please retest.
>
> ---
>    board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its | 8 ++++----  board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its | 2 +-
>    2 files changed, 5 insertions(+), 5 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
