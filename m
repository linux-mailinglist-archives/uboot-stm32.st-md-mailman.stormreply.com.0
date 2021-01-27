Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741B305DD7
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 15:06:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7891C57182;
	Wed, 27 Jan 2021 14:06:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A01DC5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 14:06:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10RE5ksW009277; Wed, 27 Jan 2021 15:06:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GVniQUGzccuqGox4Gah2ZuZNwHt9Q6l4S/eqHXj4A+c=;
 b=Fh3Ak8Gzp5AT5dajouGgnNdyLLTFOjqqrN69WE9jWgbyXrEd+ZwviIhpzAncZYMlxb2i
 x4GvvMLxzJbJYKeO5KynbK3uV3vEktIM+k4ZnEBz2WT7gOyqff3DdnCPZrb0NBDD6C5Q
 taj3puJUMcSHz/Vr/KBmwkYbS8OApcHv19we+9XZKbdiPxBCHMg7UiLdOJa/gV5eS6kB
 mlmdgoA+B6E9tbriyNqT2QrT6Xy90fROLQ+potFkLng5jG8ajQ1hV5keecD/TU3vzrIq
 FDANaLkOKvq61g9rdTZRTCRIebSqahAHX+yd2CgCpq4ScLm+OsKEsbYbpCYeI7drd9Fs 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368c1607s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 15:06:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 640F810002A;
 Wed, 27 Jan 2021 15:06:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5823B245C66;
 Wed, 27 Jan 2021 15:06:51 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 15:06:51 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120124340.23612-1-patrice.chotard@foss.st.com>
 <20210120124340.23612-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <73ae1d8c-7e2a-2a4d-bcd8-a8ea0f69ae07@foss.st.com>
Date: Wed, 27 Jan 2021 15:06:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120124340.23612-2-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] pinctrl: stmfx: Use PINNAME_SIZE for
	pin's name size
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

Hi Patrice,

On 1/20/21 1:43 PM, Patrice Chotard wrote:
> Instead of redefining a pin's name size, use PINNAME_SIZE defined
> in include/dm/pinctrl.h
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/pinctrl/pinctrl-stmfx.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
