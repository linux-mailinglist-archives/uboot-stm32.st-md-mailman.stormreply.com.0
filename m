Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27418338939
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 10:51:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7354C57183;
	Fri, 12 Mar 2021 09:51:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1291C56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 09:51:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12C9eVvi009433; Fri, 12 Mar 2021 10:51:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=M9Eofn5w/dKn7M/q9Ndp2cevZzth3PCm08yjjkcr8RE=;
 b=bdhWnRR3q3bY1X8ZdK98cHyxRCNW1169+6Za3Euti7y7qVgyq5o9sFFxoJKTa5eNUcbu
 7119Xu2XHVpuNXuetZzSKlv4ckNY/LDHR2ORM4RWRGddwMmynVhpM066A0/b99nEHWSq
 Zwd8tCEXWfKTdhYUu9DO+fhw7yDxC31sViJJNgZvDHvsGb1LbYrkS1MvZ2aSB85PIWqo
 dCGysGInXxI5taBlvIdE8UCRSNeEXEE+WDwdrz3rrJu8sN7mH16FZJw9k9u9gXR7v37M
 JaudCIssuiOcuD9SVYG2St4uucPkm/o7ABqHDf/ybCgWCHoUlTgf5CvYPsTTt30Znn19 OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y7bk2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 10:51:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECEE410002A;
 Fri, 12 Mar 2021 10:51:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E362B2326C2;
 Fri, 12 Mar 2021 10:51:09 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 10:51:09 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224123821.22848-1-patrice.chotard@foss.st.com>
 <20210224123821.22848-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <9a141930-5eb0-873b-6800-de6c9f40a8ae@foss.st.com>
Date: Fri, 12 Mar 2021 10:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224123821.22848-2-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>, Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: st: Remove board_early_init_f
 and board_late_init callbacks for stm32 boards
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

Hi Patrice

On 2/24/21 1:38 PM, Patrice Chotard wrote:
> Remove board_early_init_f() and board_late_init() callbacks for stm32
> boards as the corresponding flags (CONFIG_BOARD_LATE_INIT and
> CONFIG_BOARD_EARLY_INIT_R) are now disabled.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   board/st/stm32f429-discovery/stm32f429-discovery.c   |  5 -----
>   board/st/stm32f429-evaluation/stm32f429-evaluation.c |  5 -----
>   board/st/stm32f469-discovery/stm32f469-discovery.c   |  5 -----
>   board/st/stm32f746-disco/stm32f746-disco.c           |  5 -----
>   board/st/stm32h743-disco/stm32h743-disco.c           | 10 ----------
>   board/st/stm32h743-eval/stm32h743-eval.c             | 10 ----------
>   6 files changed, 40 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
