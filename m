Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05C51D3AC
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 10:49:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A71C628A8;
	Fri,  6 May 2022 08:49:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E723FC6047D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 08:49:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467hf5L026502;
 Fri, 6 May 2022 10:49:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3WEiOG1wR1HLBSKYQuYkVvMWneQEJyt8TgZ7kwagH8Q=;
 b=bD83UFZAEP0ny+ax7fO2zmLFcZX8rHZNrYwBR/m0D/awDyjmsxcXDYNXrXS8pYUsODy9
 RSpXo0Sa3+vyLW1K4xNsj1fb+6bMqmTJPU1yLcdBwQCmr9MJK/BL+GwjXsXGCDOhkTK4
 C02DjChnpefwh6P2FMKnvpQoTi7mLB/UQ/MNvp+nMA3KDCUpcfB+RM3uawnNdwYFM2wu
 yQdTJDl+9pyziYNbm3Gqc/MJ5MK83q//MkU0M1qnHcG7sU5TDpzSBXXl87ESCsjVPpKu
 eHEnnupQAna3y4cWncjaG2nccbUyyiCOEzRZrxMzzL95DJk4zLjOKAdcy3Ob203OMaUp 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt899cjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 10:49:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1140100034;
 Fri,  6 May 2022 10:49:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E81C8215146;
 Fri,  6 May 2022 10:49:16 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May
 2022 10:49:15 +0200
Message-ID: <5b460165-824b-0352-7e18-19330205003c@foss.st.com>
Date: Fri, 6 May 2022 10:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
 <20220427115401.155400-13-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220427115401.155400-13-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 12/12] doc: Add documentation for STM32
 MCUs
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


On 4/27/22 13:54, Patrice Chotard wrote:
> Add documentation for STM32 MCUs (F4, F7 and H7 series).
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
> Changes in v2:
>     - fix documentation file stm32_MCU.rst
>
>   board/st/stm32f429-discovery/MAINTAINERS  |   1 +
>   board/st/stm32f429-evaluation/MAINTAINERS |   1 +
>   board/st/stm32f469-discovery/MAINTAINERS  |   1 +
>   board/st/stm32f746-disco/MAINTAINERS      |   1 +
>   board/st/stm32h743-disco/MAINTAINERS      |   1 +
>   board/st/stm32h743-eval/MAINTAINERS       |   1 +
>   board/st/stm32h750-art-pi/MAINTAINERS     |   1 +
>   doc/board/st/index.rst                    |   1 +
>   doc/board/st/stm32_MCU.rst                | 186 ++++++++++++++++++++++
>   9 files changed, 194 insertions(+)
>   create mode 100644 doc/board/st/stm32_MCU.rst
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
