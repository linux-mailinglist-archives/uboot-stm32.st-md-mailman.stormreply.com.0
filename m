Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3114630DF
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Nov 2021 11:18:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A04C597BA;
	Tue, 30 Nov 2021 10:18:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9A64C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 10:18:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU6et49000494;
 Tue, 30 Nov 2021 11:18:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=h4OOVtqsoiswKSlh5w+5sE9hDAuU4Gv2CVn6fJ95TWE=;
 b=m6FjF366tpDZaAoV3zipYtHLHnrnE99kstPX4bWxudalnshucbf/JpbziO21FhQhdhQi
 QgqeE4N7oD3c7hCnhUUlv0a/Ls/Bln5GfX/C777sZe0t8+xljbSfXYptaYFqa/EtYBhc
 I1xQ7Z7x0O05RwvK/j0psmV/ZrabeePs+JGvnyNnWmPX92qu4GqVst0Z8Z/9lBBhTGlz
 GJINJUN4xLLU4hWG9zMGzSSVGxJPQEZlOXAj+rIFftD2SpVudTpKW+bpP4/N77fCMylo
 aAam7FT42SXcwczsPDWkAlDl2YDmRw2vHih+fKud0kkxUzb0zGnM5bgeB94T/0RbTujo 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnewbhb8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 11:18:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BAAF100034;
 Tue, 30 Nov 2021 11:18:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1C58226FA1;
 Tue, 30 Nov 2021 11:18:56 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 11:18:56 +0100
To: <u-boot@lists.denx.de>
References: <20211115103920.30149-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <80a3cb2c-a38c-73e4-af45-e9474d793fcb@foss.st.com>
Date: Tue, 30 Nov 2021 11:18:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115103920.30149-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_06,2021-11-28_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 0/8] ARM: dts: stm32: use lower-case hex
	for address
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

Hi

On 11/15/21 11:39 AM, Patrice Chotard wrote:
> Replace upper-case hex with lower-case hex for address in STM32 device tree
> 
> 
> Patrice Chotard (8):
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32mp15-u-boot.dtsi
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32f769-disco-u-boot.dtsi
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32746-disco-u-boot.dtsi
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32f7-u-boot.dtsi
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32f469-disco-u-boot.dtsi
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32f429-disco-u-boot.dtsi
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32f746g-eval-u-boot.dtsi
>   ARM: dts: stm32: Use lower-case hex for address for
>     stm32429i-eval-u-boot.dtsi
> 
>  arch/arm/dts/stm32429i-eval-u-boot.dtsi  | 2 +-
>  arch/arm/dts/stm32746g-eval-u-boot.dtsi  | 2 +-
>  arch/arm/dts/stm32f429-disco-u-boot.dtsi | 2 +-
>  arch/arm/dts/stm32f469-disco-u-boot.dtsi | 6 +++---
>  arch/arm/dts/stm32f7-u-boot.dtsi         | 4 ++--
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
>  arch/arm/dts/stm32f769-disco-u-boot.dtsi | 6 +++---
>  arch/arm/dts/stm32mp15-u-boot.dtsi       | 8 ++++----
>  8 files changed, 16 insertions(+), 16 deletions(-)
> 

For the series, applied to to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
