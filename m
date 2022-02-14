Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C983E4B6B3E
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 12:35:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DBD4C6046E;
	Tue, 15 Feb 2022 11:35:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81246C5F1D7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 15:21:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjeHRrInrVn49g/cXiYnIM4ENgNfaurVhe99C1P+Y700Ak5d8dEUZVIPDIci2jNUJXyKWUh2Qx2BlI04WIADkUvz6MZZHzwgFtQ9FsOxT9DLZnfLA6xnrcNc2NN9mpP7kJTYrSTe91IgIHO/y5vhRWyeEvXI+YhdIYmyIHih7TFmYSgwxqnXBAgxm5WX/PStrxDibvC1e+wVXDLmTwh8HnDc/2paNZIaSfm9kVYgKE0nuWh3XRVbMS84K33vz5KXyYa3XjHY0/Ak/r06G5E9J7Q3o284S0C3qW0GrmWDgNQ5u3r69bIxdBo1aV1UoXlxP5E1EYXYo4AYzHC1ITxHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40XXO84MIl9gNwoc13hQDvYoKzPgEK86iASXZ59oAx8=;
 b=HCzOiBQymMVZDNDdcc0gYM4Vk/dJ6xHROg+h5aaOe+7KHQ3hiJ+15HV9m2PlnxUUiQiCs71NMCSeeYidzQ+jQrb6EUWC0nX7CLKA+3kpi92dy+nmjyIwVE+tyLdhuwcUsbPYBM+CXIygX5lVjRL+It/FTVIrF1KRk89idvuskVQ6s0f1wq0lc+1hXHIGmZ14JDInYwUAvos8C7wg9EpAsm4PoUH71+IxNGindru1ygC5+CmwAyzNn8RohoOknoEb4vGG61UIojo2dbgDXd4VY6SzJ5sxjGjt3htI/2FfONTuw6VSmY/xIwbKoCK4RWKO3Cz5/RCEcb8Ic14zzH5k0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=foss.st.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40XXO84MIl9gNwoc13hQDvYoKzPgEK86iASXZ59oAx8=;
 b=eZ+pITgC+UHQx3zhqgOZb3y92RCRr7ZXUoM7X8HOdw472SKhIjfQkmNtKqRfQ0NSr/fPeNxkB9k2eGA5PT43GB2InpFUaMWuElH1lZKS0/m2PJftutsAARSU6H+W0DHBeEigtYoSeGcH5WnVxGFIs+cqWJu9hwAMZYJ3d3JJtq/huykZCHuiWTdrXGnB6m4DCkMLRTuodMCMuTNSI9wOBdjnR7MuGaVofaGM4Vbr0lOjr2584o0xQHCueijBLEKock0VaQBEZZ1wbB5X+clXk5M7ZO+/eNo2sHhnuFyLN24POa6H+d8NELGt4iMppwZDuwo0esrY5BIfI/NEZ321rw==
Received: from OL1P279CA0045.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:14::14)
 by AM7PR10MB3858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 15:21:31 +0000
Received: from HE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:14:cafe::f3) by OL1P279CA0045.outlook.office365.com
 (2603:10a6:e10:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 15:21:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT032.mail.protection.outlook.com (10.152.0.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 15:21:29 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Mon, 14 Feb 2022 16:21:28 +0100
Received: from [167.87.32.96] (167.87.32.96) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 16:21:28 +0100
Message-ID: <a0c92956-a235-622c-ca0f-9b5d6eef3e67@siemens.com>
Date: Mon, 14 Feb 2022 16:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 Simon Glass <sjg@chromium.org>, Nishanth Menon <nm@ti.com>
References: <20220104074248.25015-1-patrice.chotard@foss.st.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220104074248.25015-1-patrice.chotard@foss.st.com>
X-Originating-IP: [167.87.32.96]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e88e0c0-825c-41bc-8abf-08d9efcdacae
X-MS-TrafficTypeDiagnostic: AM7PR10MB3858:EE_
X-Microsoft-Antispam-PRVS: <AM7PR10MB385864BA676AB2DDE4766A6595339@AM7PR10MB3858.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZjiJp9yByGfQyfj4RmfCxn3SrnGQraX/eAGRO4M9bVGjHElcfxroGGZCX1MK2NwrEhWGcA6TiSk/D4mRq9viq1+e5LC840iB+ZCPulY2A7ZrZgKLgwPx0JRfs8vl7l3xdNhpTmhn2eUt2sSE9W2GfHujmuX04aSwNcPIacGFJYd28RexsabuR70fGelnmVkj92qZxOwgPJ5OUxoRLrnzR84z0floeoV+c4Pq37TODm5b7VpXcKOM5ffIJPOuJ+stlxO1nXvI03bv5i+UNbXYMDhoN8MArO+HdVJwEqp5HGaDc9r4Pi/bvON6/IbFBC75j/OCz1wacfYFeVsVdH284XWz8GYelDRdtvCB2AVFERqtUxSXlGrGfxnuiKF7inDKxOrb+9dGFjO4m792s9pUfMQ9ec94L44sittYlwii70yyTP5MXvRVragnRYuqQzpRGeWbw5fLQrdUrtWhbbxFA+aK1bOrsG03w1bTnfnWYJHIgZsflVbQzKtjMf9i0lM7chtXsFhk8WlAOetYHUsnGitFPCin5BQn7SffDDokyKKAlV45A5iYcorO0SPxidwhTuV8h+sa2E8cyb9JsL85JDiDSNmuo9oxuF/quHc+Hrz8WrHIkKjvrD/sJ0d55oWF7IecBCR6p8Mnf3wXjFEVdC4FZ+72x9K55G/xMBswoMX03ha5IQOd9iV8ms8hNL221gNsNZj8RwmkqgK0KTltC6Ba6Yv8YAIoaZzDHbwf7otXq7DD+v6+Mbh+x3lyN9by4pZcB82G/JEqMHCeN/OBiA==
X-Forefront-Antispam-Report: CIP:194.138.21.70; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:hybrid.siemens.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(5660300002)(110136005)(508600001)(54906003)(83380400001)(31686004)(31696002)(70586007)(70206006)(2906002)(44832011)(36860700001)(4326008)(8936002)(8676002)(7636003)(356005)(82960400001)(40460700003)(86362001)(47076005)(7596003)(53546011)(16576012)(336012)(186003)(26005)(316002)(6706004)(82310400004)(36756003)(2616005)(16526019)(956004)(3940600001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:21:29.3216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e88e0c0-825c-41bc-8abf-08d9efcdacae
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.70];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3858
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:35:01 +0000
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Fix OF_BAD_ADDR definition
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

On 04.01.22 08:42, Patrice Chotard wrote:
> When OF_LIVE flag is enabled on a 64 bits platform, there is an
> issue when dev_read_addr() is called and need to perform an address
> translation using __of_translate_address().
> 
> In case of error, __of_translate_address() return's value is OF_BAD_ADDR
> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
> which is defined as (-1U) = 0xffffffff.
> In this case the comparison is always false.
> 
> To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
> AARCH64. Update accordingly related tests.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
> Changes in v2:
>  - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged
> 
>  include/fdtdec.h   | 5 ++++-
>  test/dm/ofnode.c   | 2 +-
>  test/dm/pci.c      | 4 ++--
>  test/dm/test-fdt.c | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/fdtdec.h b/include/fdtdec.h
> index 6c7ab887b2..e9e2916d6e 100644
> --- a/include/fdtdec.h
> +++ b/include/fdtdec.h
> @@ -24,16 +24,19 @@
>  typedef phys_addr_t fdt_addr_t;
>  typedef phys_size_t fdt_size_t;
>  
> -#define FDT_ADDR_T_NONE (-1U)
>  #define FDT_SIZE_T_NONE (-1U)
>  
>  #ifdef CONFIG_PHYS_64BIT
> +#define FDT_ADDR_T_NONE ((ulong)(-1))
> +
>  #define fdt_addr_to_cpu(reg) be64_to_cpu(reg)
>  #define fdt_size_to_cpu(reg) be64_to_cpu(reg)
>  #define cpu_to_fdt_addr(reg) cpu_to_be64(reg)
>  #define cpu_to_fdt_size(reg) cpu_to_be64(reg)
>  typedef fdt64_t fdt_val_t;
>  #else
> +#define FDT_ADDR_T_NONE (-1U)
> +
>  #define fdt_addr_to_cpu(reg) be32_to_cpu(reg)
>  #define fdt_size_to_cpu(reg) be32_to_cpu(reg)
>  #define cpu_to_fdt_addr(reg) cpu_to_be32(reg)
> diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
> index cea0746bb3..e6c925eba6 100644
> --- a/test/dm/ofnode.c
> +++ b/test/dm/ofnode.c
> @@ -286,7 +286,7 @@ static int dm_test_ofnode_get_reg(struct unit_test_state *uts)
>  	ut_assert(ofnode_valid(node));
>  	addr = ofnode_get_addr(node);
>  	size = ofnode_get_size(node);
> -	ut_asserteq(FDT_ADDR_T_NONE, addr);
> +	ut_asserteq_64(FDT_ADDR_T_NONE, addr);
>  	ut_asserteq(FDT_SIZE_T_NONE, size);
>  
>  	node = ofnode_path("/translation-test@8000/noxlatebus@3,300/dev@42");
> diff --git a/test/dm/pci.c b/test/dm/pci.c
> index fa2e4a8559..00e4440a9d 100644
> --- a/test/dm/pci.c
> +++ b/test/dm/pci.c
> @@ -331,10 +331,10 @@ static int dm_test_pci_addr_live(struct unit_test_state *uts)
>  	struct udevice *swap1f, *swap1;
>  
>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1f, 0), &swap1f));
> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>  
>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1, 0), &swap1));
> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>  
>  	return 0;
>  }
> diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
> index 8866d4d959..e1de066226 100644
> --- a/test/dm/test-fdt.c
> +++ b/test/dm/test-fdt.c
> @@ -768,7 +768,7 @@ static int dm_test_fdt_livetree_writing(struct unit_test_state *uts)
>  	/* Test setting generic properties */
>  
>  	/* Non-existent in DTB */
> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr(dev));
> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr(dev));
>  	/* reg = 0x42, size = 0x100 */
>  	ut_assertok(ofnode_write_prop(node, "reg", 8,
>  				      "\x00\x00\x00\x42\x00\x00\x01\x00"));

Since this commit, I'm getting this dev_get_priv warning:

[...]
U-Boot 2022.01-00766-g9876ae7db6d-dirty (Feb 14 2022 - 16:15:21 +0100)

Model: SIMATIC IOT2050 Basic
DRAM:  1 GiB
Core:  94 devices, 28 uclasses, devicetree: separate
WDT:   Not starting watchdog@40610000
MMC:   mmc@4fa0000: 0
Loading Environment from SPIFlash... SF: Detected w25q128 with page size
256 Bytes, erase size 64 KiB, total 16 MiB
drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
OK
In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  0

(I've instrumented dev_get_priv to tell me file:line)

Is that a sleeping problem surfaced by the commit or a real regression?
I can boot, though.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
