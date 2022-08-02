Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64954587BD4
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 13:54:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04001C0D2C0;
	Tue,  2 Aug 2022 11:54:31 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 334FCC035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 10:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD8GD9kEZ1t+5/ho2SUlTTccFFU4LcNzt7Erj6a3RqGnRQB7o+vg/Suo8qMgUcmd6CL/cktcamOQZo1BbJQDV2EnBT+YICurdRjHTepAGs7Gj9UdxiACxDCFxqPxxVU5qvhow45yv6q8nWrx3q41yl3qg+c6QI7jAFKdnaUeTJaYoyO8t3QDdpcjvG1HY7PG/3PHFoNXPpyNOmJLlw0vsz0ZXcZLYHXuEXopBwOAbnzof+o4HWwaIv+wIt2QPGan35jWK7gdXBU7nXat/LdIaE8CGpyyMqpSGNzqsmFsTrssfHnGmH+t7y4fjy6EzlsUrKGpn9V3D5QrjIhsu6A6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoWySZJkYPAclz3LCIjMMy5jtrtW4q/AQsY6w2qLOQc=;
 b=e1SgjDd50EKM8qC3ih08nY9gizEgyEqpP1Om5/mNPHr9Qf0FTqMBR1wyvU/J3P+DfEuUbmi8UZzilzQQB8/5ZlMhuZKr42VMtU8A+sR6djmtxA1FfrEqnpv3bwMLGhH4V2x5FPz22jNa7if1Y+zpp7Q3K1+d30ioQKP8VtBj5xwVjsl4DF4+CS7g1meeolnD8MPO94a/lz5B2cFwYPON7qV6PTgYuZDk/FDX1HQj3UDyzm1PAlTmVkf4RpDypYWJRgocd19Srh58Qhdlp1ak4l7NRUEOxIA9r+9r6EXJc0XoT6UGsB/mwsJWeSsIqtDuIdKygz0e8zQRvf+xrCudOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoWySZJkYPAclz3LCIjMMy5jtrtW4q/AQsY6w2qLOQc=;
 b=c4/s3Z7Bc8lv6EieaUWLoNk/oXemzI+GyICOe4EVY6RiccKcAZdD1tEdxJvRhOvfdJE25OiMizzZFyZq/kaEAf+2bjpgzmmb9pt2uaX4oSBGOat4ZUC7vXaW4DdMgeqxFpNHRRdNxH8LxCbUVQzEiEKIDPLnj6bcMPzUFnqA74E=
Received: from BN9PR03CA0445.namprd03.prod.outlook.com (2603:10b6:408:113::30)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 10:23:38 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::79) by BN9PR03CA0445.outlook.office365.com
 (2603:10b6:408:113::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14 via Frontend
 Transport; Tue, 2 Aug 2022 10:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 10:23:38 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 05:23:34 -0500
Message-ID: <d8a74f56-3562-3783-223e-3c757a2810e9@amd.com>
Date: Tue, 2 Aug 2022 12:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>, Tom
 Rini <trini@konsulko.com>
References: <20220802082135.271308-1-patrice.chotard@foss.st.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20220802082135.271308-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c03c0c0-e70f-4d86-5d99-08da7471107b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4406:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4G8mqkxKWjBq2cAoa4jD1NE/5wriWamcQ3qYPnyIV4f58+DikOCLTIyIKGVtEDRyEq0ItATdpbOPJcpmGh5LwD/MF7KmviMAnXxzjKI4oxu+zycekq2jfBjRaEv4Jloe/CE3Tkd6ZIu/fNotimjm/RNEQcsZZpUCJBqh/rpPIF4oEOzTEiS9808/clf9eOs/0yp+ZQrOndGG4kSvU0E+zacgQe2n5q+td2kHzY0OS+5Dj4Wdt8NwbcbS2yv/c6pKaNJC5eLIYVQfFtaJZl30Urq6h3BplOgE8fkUHpe/PFheWq1/xxEcTlxF0YJkwGwyfLDs3X3UORlpk874Ak9CQfpQTYhqhgQhOnZANgQYuI5xoC8g1Ey8N+8E820c1A/D/7qv6bDbXeVxHoJ3SoxFC8p1P2loRpsG6RwfbhSa9HhNUlWRXRL9ZnbOjJ05lSpxEWIG2L+6TCNrqssihhBAfW7gxvUYwXHs37de5y4/WCMhfj70mZ6QAKfCoEYsdvZIeFAArI3MHKlXfFI/Fhv+a7BDZw4AKrVxag5jR6Lp90z7Ay/QpE/W42TQnVfkKFmtkvcG5LmS2zEjvaYRFdQl43X+KVQRn6xFAMzokPVi3t4CjpJB2kHBxaw3+2JuzgXapYQAeOZogWSOYgfIisIijLj62C7gghvWVJuh3sC+slGf0s6aw6noAf5HCcnfzMeB7Hvp88goqaY9eeGwLYz9RYasoTgaQGuMqyFW21diuwB+39ZHBUDxZr6MHUt/fxBsktDZlVPHf/X8T0a4kpVCL0tY9R31AWzkiGvjcrHzkuN9lbb55IsLtq9J6+e2Yss8e4uBCjCmtifny9JgOuycPKpOLr9VGmkee41Px9/RAHw4vmQQ2cN/I7M1yKkpjvZS
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(31696002)(6666004)(53546011)(41300700001)(26005)(16576012)(40480700001)(54906003)(478600001)(110136005)(82310400005)(356005)(316002)(40460700003)(82740400003)(81166007)(86362001)(426003)(47076005)(2616005)(186003)(16526019)(336012)(36860700001)(83380400001)(44832011)(36756003)(2906002)(8936002)(31686004)(8676002)(70206006)(5660300002)(70586007)(4326008)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:23:38.2212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c03c0c0-e70f-4d86-5d99-08da7471107b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406
X-Mailman-Approved-At: Tue, 02 Aug 2022 11:54:29 +0000
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] lmb: Fix LMB_MEMORY_REGIONS flag usage
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



On 8/2/22 10:21, Patrice Chotard wrote:
> This patch is fixing a broken boot observed on stm32mp157c-dk2 board.
> 
> IS_ENABLED macro should be used to check if a compilation flag is set
> to "y" or "m".
> LMB_MEMORY_REGIONS is set to a numerical value, IS_ENABLED macro is not
> suitable in this case.
> 
> Fixes: 7c1860fce4e3 ("lmb: Fix lmb property's defination under struct lmb")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>   include/lmb.h | 2 +-
>   lib/lmb.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/lmb.h b/include/lmb.h
> index 1476d78c28..7298c2ccc4 100644
> --- a/include/lmb.h
> +++ b/include/lmb.h
> @@ -68,7 +68,7 @@ struct lmb_region {
>   struct lmb {
>   	struct lmb_region memory;
>   	struct lmb_region reserved;
> -#if IS_ENABLED(CONFIG_LMB_MEMORY_REGIONS)
> +#ifdef CONFIG_LMB_MEMORY_REGIONS
>   	struct lmb_property memory_regions[CONFIG_LMB_MEMORY_REGIONS];
>   	struct lmb_property reserved_regions[CONFIG_LMB_RESERVED_REGIONS];
>   #endif
> diff --git a/lib/lmb.c b/lib/lmb.c
> index f21fe672ae..c599608fa3 100644
> --- a/lib/lmb.c
> +++ b/lib/lmb.c
> @@ -108,7 +108,7 @@ void lmb_init(struct lmb *lmb)
>   #if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
>   	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
>   	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
> -#elif IS_ENABLED(CONFIG_LMB_MEMORY_REGIONS)
> +#elif defined(CONFIG_LMB_MEMORY_REGIONS)
>   	lmb->memory.max = CONFIG_LMB_MEMORY_REGIONS;
>   	lmb->reserved.max = CONFIG_LMB_RESERVED_REGIONS;
>   	lmb->memory.region = lmb->memory_regions;

Acked-by: Michal Simek <michal.simek@amd.com>

Tom: Can you pick this up directly?

Thanks,
Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
