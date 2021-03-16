Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1397233D503
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 14:39:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8A07C57B77;
	Tue, 16 Mar 2021 13:39:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83CC3C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:39:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GDbDgs030749; Tue, 16 Mar 2021 14:39:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Z+qzO1ylyMyISaKhqdoD+ftNs6ixIdJuKM0zy5RzFS8=;
 b=Jm5vP7xW/JnNNfP0xTtfqTuflzl0eaZZV6pxccdLu+L5byMFqpqYZn88JJ7LSpde+U6d
 6Y0W2G9lqRYM/5RaZKmyip9obqonEBdz5EwRbQzEkre4znieG6OhKgcR/8KvTGfOPuMh
 iV/bsbsDjz20mvGJjCnwF3rk3wPujB4lUJuf24zt0dWg6OrWo4/SYeItjdMd3QfmnRgQ
 K9TjwpynrGTbc3HSIkQ8isxzx/eSvwd1/VeKVvQ2A+4K3mciYLONc1VkYaK06EC6Zrs4
 Xac5JR2unrORNL78/p+CGf6w8BYZwzkorR0G7sDWb7jSpAqZ+JmJmd/sQdlMh5XFy4RB Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 378ps9gray-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 14:39:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E47810002A;
 Tue, 16 Mar 2021 14:39:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 142F8231DFD;
 Tue, 16 Mar 2021 14:39:21 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 14:39:19 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-6-jagan@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <f78f4c8a-484d-d707-c656-e7e6e48396f7@foss.st.com>
Date: Tue, 16 Mar 2021 14:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315173256.103731-6-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 5/9] board: stm32: Add Engicam i.Core
 STM32MP1 C.TOUCH 2.0
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

Hi Jagan,

On 3/15/21 6:32 PM, Jagan Teki wrote:
> Engicam C.TOUCH 2.0 is an EDIMM compliant general purpose Carrier
> board.
>
> Genaral features:
> - Ethernet 10/100
> - Wifi/BT
> - USB Type A/OTG
> - Audio Out
> - CAN
> - LVDS panel connector
>
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
>
> i.Core STM32MP1 needs to mount on top of this Carrier board for
> creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
>
> Linux dts commit details:
>
> commit <6ca2898df59f> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
> C.TOUCH 2.0")
>
> Add support for it.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - collect Patrice r-b
> - add linux dts commit
> - drop CONFIG_BOARD_EARLY_INIT_F
>
>   arch/arm/dts/Makefile                         |  1 +
>   ...2mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi | 51 ++++++++++++
>   .../stm32mp157a-icore-stm32mp1-ctouch2.dts    | 47 +++++++++++
>   arch/arm/mach-stm32mp/Kconfig                 |  5 ++
>   board/engicam/stm32mp1/MAINTAINERS            |  6 ++
>   ...stm32mp15-icore-stm32mp1-ctouch2_defconfig | 79 +++++++++++++++++++
>   6 files changed, 189 insertions(+)
>   create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
>   create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
>   create mode 100644 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
