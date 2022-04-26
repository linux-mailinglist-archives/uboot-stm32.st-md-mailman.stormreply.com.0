Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C24050FC0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Apr 2022 13:37:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13C21C5F1F2;
	Tue, 26 Apr 2022 11:37:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E12AC5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 11:37:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QAWpBO025876;
 Tue, 26 Apr 2022 13:37:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EWWCTCVb4r44JawulKXFVtCzCXba1weyPcQBVCZQq4M=;
 b=00nfyRjOI57jSPNdfGWXB9ihR/5PKWU9fWRrnMBP9FHtcO9z+BZgbCRZ18Sbl2/YeCB8
 rWh9ZL2ljsPZr2heldCq4fFWJiKAHm5htTopeToxzk3yaGPDMBC1djfrVfiBbiY7ngJf
 61gSaBBRxI4T0z02OYuNx4GuU6Wi0KXrcIjRQY9p6YTotKhQzEzyOjgCpSRCxLlsYuah
 RjqZfu8gcawyWJHpYfFGwG+jCMIHCAaH2LtWvseHixFQpUWtjs0Q/PP37feOM8UbCZ+x
 462r5ku3gFDyfKGSPN2MAZtFosiqlkjT+6HO0c1g/tLD4uB6U0rvVT1sPML3lrf1U2Zn 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm8t1pmas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 13:37:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BE7C10002A;
 Tue, 26 Apr 2022 13:37:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25EAB21FE9B;
 Tue, 26 Apr 2022 13:37:49 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr
 2022 13:37:48 +0200
Message-ID: <adce54e5-ecce-397e-625a-01e245e32985@foss.st.com>
Date: Tue, 26 Apr 2022 13:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220413150500.23883-1-patrice.chotard@foss.st.com>
 <20220413150500.23883-11-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220413150500.23883-11-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 10/12] configs: stm32746g-eval: Add
 stm32746g-eval_defconfig
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

On 4/13/22 17:04, Patrice Chotard wrote:
> Add stm32746g-eval_defconfig for stm32746g evaluation board to
> build U-Boot proper.
>
> Full board description can be found here :
> https://www.st.com/en/evaluation-tools/stm32746g-eval.html
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   board/st/stm32f746-disco/MAINTAINERS |  1 +
>   configs/stm32746g-eval_defconfig     | 64 ++++++++++++++++++++++++++++
>   2 files changed, 65 insertions(+)
>   create mode 100644 configs/stm32746g-eval_defconfig
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
