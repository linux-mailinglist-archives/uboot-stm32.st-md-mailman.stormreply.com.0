Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C093702A5B
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 May 2023 12:18:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3185C6A611;
	Mon, 15 May 2023 10:18:16 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44673C6904E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 May 2023 10:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDZfiZgKneM6O7fU0POdAYOPmfI/9LACGJcEomDMi43OP9yNuow3loXfAAxrQP/3D68nROxwY2ZwggWzj/iw6rCXxnwBmJdydBMLqzVFauoFqJ8bAmKrMtW/dm5G3XbK/Xp4cMMD4fMZWVx83ruIEcaD7C4XP98dWq8nJeawnsEqgRAHlVIkibal9u6/PB+vWctFsPCr2pNpRKOJPff3jcNTEZ/4xHyOCyENhKk1WH6xjxu26WqZbm7fb1lGQ3COpgpfWbGcq9URo2BnaSOtHnOqBLtJEs08lqfm0FaqHD9Hp8zeWRUSTJJt6kUj/rdlQX2fRHMl9qECaDbfxzplVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csupnRCuUbFtZ9xe3A44EO1WNk7nsLnB5/tNbIJFNes=;
 b=f6JrRWuOl1lPg4+z+zPx75cMLqtE7tXTAjvXlglk438uE1h5+wqY3pUiGfhVdl2hCZSFc+E0z+gbWVoDVYxpQaN3eFJkQ1bk4nRnGXPN9XoDcL/ckNtWYZGGz+3sjjERfUwa3dy6xnb9NhphjE3L9teSuSJ5WXwhsEp+2h8CCvJjkkkgVuFuH8+rfJr6tuEuFs8e7LtaxzGLvSg4zyFs1znHOk7y7m4gQaJVFtIMouj3DO50VxdOnEdT9VrXsxedYwTUEeuW2xF6Q0XE6Ai8lalLCerwT7lsG30hSwoUilCWAhU5nnghNSTv7YSGoFrDtQm+cdKpSm8v6b8xKoxejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csupnRCuUbFtZ9xe3A44EO1WNk7nsLnB5/tNbIJFNes=;
 b=f+pe4/2B/W4EkJjplA+kjtHzRM6xpp3QtZgR8KIjYaMn1F0azqSEQt+eB5wjwGhJrjEGQk9vmrkWoxSgKWdHB29Nk9S2BmLg7UOCtr0KUQTXhns3DZGMrWfPgqQngWuNDkNdD0fJCV1aODnL9U07BKZgiA/j/XXlORCbu78NXZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 10:18:12 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::e78e:b7da:7b9a:a578]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::e78e:b7da:7b9a:a578%4]) with mapi id 15.20.6387.022; Mon, 15 May 2023
 10:18:12 +0000
Message-ID: <452d85c1-4ab3-d933-95c0-956fd9b2946b@amd.com>
Date: Mon, 15 May 2023 12:17:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Roese <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20230503203720.4128156-1-ivprusov@sberdevices.ru>
 <20230503203720.4128156-2-ivprusov@sberdevices.ru>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230503203720.4128156-2-ivprusov@sberdevices.ru>
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f092e2-9c81-486a-d541-08db552daffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFZe4EoNN7wO+f2/soWiYb3C6qqgLU7PDLl6Z/OfZuGDU/Abql4HvqwtUGEkK0wxhjgYbhEf6/a8/Ns1+jeqeijBc+jG3puvbswbjeNL5hCu0yYI9CEQ1dXNN56y04KX0zaEC973KLb4K4WtY3ac7hJqJApebMAyykrmNlSaGsvF4EB+Apl5VL6EjsRV0UGWdQIh6AKHJN/v2ZvvLkd3AdYom2y4zBBxO6X05NL8oMWQi2A0GsJQLHarpVTVhMlQ+Nxqlu6cJPj2UsOxLXmxzm3QEO7ce2MOFSell9hcJ3PdUWr/wN7CW8I9QoIFTJsKAT1FWAey++u1o8JQuTQfNXCqmOYYbuGe+2z0BHgfYMf6TGkLXv4rXS/bXrdAIdQQfze3UtnomzljbhVMbvrCWS2s57EO20KzFnvBfGwtAYBpq2JA/32GbzKzPmIw79F8zwjP2HyW0Y2xMruwTY0prW7gWyEfgGMXjcmgom7RvuVPQaBjZQLgZkfyXxL0zGCEOi1WCBGB98t/wtKnQoCsJ8XzHgqAYuaIFeXfdHjwbJhcIs8Y3pr2+CbhVvmHeC2DDt3WfstiBKn/NQSXZnHN+l42gQjE6Hc1LppDJVqUl/oQVUKwDD0Mo0H0x30ZEZbKJSYkc+lsqdq6r7O0N9nDpzO/wsVn/8s4WGoUgo5Kl2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4758.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(31686004)(921005)(38100700002)(31696002)(86362001)(36756003)(4326008)(316002)(41300700001)(5660300002)(8936002)(8676002)(7416002)(53546011)(6506007)(6512007)(26005)(186003)(44832011)(2906002)(2616005)(66946007)(66556008)(66476007)(6666004)(6486002)(478600001)(110136005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2RjYVYxOVQzTDJ2M0F4eVZ1VExHRjFaUSs0bjRjcXlUTHVldkc5VVBXbGd6?=
 =?utf-8?B?ZHhCeTVnU21aQkJjKzJzWDZvcWRjZE5NeHNPZ3hyNXlGcnRYa3YxQyt2OGNv?=
 =?utf-8?B?RUdTZEdsdGdxdmg4MVlyS29Sbks0THlrdnhta3RuYndmY1d2NmNvQWYzMXNJ?=
 =?utf-8?B?YUZnTy9BTXNUSzBEVE44bFF4cnJyNnoxeTB2dUQ2WW9qOTdLZURqNzJqVE5U?=
 =?utf-8?B?dVZiUnBWRXE5dmtYYldZTlI1MU13TzVTTTNqaHlpcjdRemlpMEZHMG9XaGo4?=
 =?utf-8?B?WWRHcCtFeEw0ZzUxdkhSSVpVSzVFTnRiM0FTaG5XRVVJOENwb2JGckFQOHRs?=
 =?utf-8?B?L3M0YTVPaEFNZmtTMFZkNFJPZm8za0d4R3dNSXVUcGgwQ2NodFhRRnUrUFFS?=
 =?utf-8?B?dGY5SDI3UXRETnFnQTRYOWU1Z0kxMEZmeWJjdER0OXE1OVdhZS9ITldwT2Zl?=
 =?utf-8?B?YmRJa1RDME43MkdnaGxqNk9DeGUzcmY0bGxFbHNJa2FLZFRrQzhHRFRFY1VG?=
 =?utf-8?B?Rjd4QzRGMHZLZHg3YzBIeU9qUXZwdUxEeDIvempMUnpKQlFqa1BKK3FHMlVM?=
 =?utf-8?B?N0ViUGdjRXBsUkJQN01laVBidGRxdXZDOGxTYWx2blVHR0VVbkN4M1RLODIr?=
 =?utf-8?B?aFRUWVBnN0x5di91TitDMk1iMnM0bUpqWWxmSGxoL0ZhQUF4VjRqSVdrYmNa?=
 =?utf-8?B?ZU1ycmd1S3pkbHdWdnBoNlF2c3dIN3A3S3dVekhTV3lNeWJFaDU2c2FFMHRh?=
 =?utf-8?B?SVN4aURmSkNPZWRGK3F4VVFGdUFYOFN4Q040Sy9lVmJkTlczK1htQ0pYTDc1?=
 =?utf-8?B?UXlwUGFVTzQ2RDUyU1ZHaGxvR2F5N1EzV1lOaVZyc1NPdEpxeEgxYmVuYmti?=
 =?utf-8?B?MDlaZnBaVXJxck5RZmN2cHdMZWFSTXhnMHJHSVFsRDRwa240VGR3dG5lczB6?=
 =?utf-8?B?VktLV29TZERISjROS2h3NVI4SDRqTHMrR2VkaFo4UUpRR1l0a0Y1TkU3bXFR?=
 =?utf-8?B?djJFREllQ3V2S2xzQlIvR3JMdk9xZEl5KzdjUGRvTlFUUm1tZ0NQclVSQzQ1?=
 =?utf-8?B?VXNEVDFXSEMzV2ZjL1JwYmhySGhMWEc0M0pURVBlQldDcG9TYW5SMmdZRDZH?=
 =?utf-8?B?ell0R0huL3dvUm5FV1hqVkg2cS9aclRYUGtvc3RvaUo0MUtjV1JVc3BHZHpw?=
 =?utf-8?B?aFRpWHVPOFlBaHk2bEU2cDdmNkhMMnF2cTZpbVRuNFRrUVgwNUFxK2N0UnRI?=
 =?utf-8?B?UmlieGxPOU9GVVJZVXhkdlEzTjNIcSs4R2ZFUjN0MHRtZk1lMGQwUnp0QXEz?=
 =?utf-8?B?K2w1N3ZBSTg3Q1dNNmtZMlp2M0p4YS9aTC9OOXdhQ0RpZERQOGtSU1k0ejRB?=
 =?utf-8?B?SXFiS2NSY1RBTW5Ic0hFTmU0MnU3MlBjYk96eXkvNE5rZytzaTVNODFBdFIz?=
 =?utf-8?B?ZTYwelMzRWt6bVN2T05zdDhwanpUbUFuSi9rVmp2VUhDa1BuZ2wwOEx4eFRm?=
 =?utf-8?B?b2dTTklEWm9LSjhkakV2aVorMTFVRTBpZW16dTMrZm84TEsvSURteUlHUXZT?=
 =?utf-8?B?cUx4RU9JR2xwOFdYWVRkN1BTV0phQVlpckUwUGlLUnczZGQyMEl3SzFhajJX?=
 =?utf-8?B?Qy91b01MR2tVQi9PMFgyeUcrSTRHYkJJMGlBL2Y0Y0ZwejN2VWQyOHVyN09x?=
 =?utf-8?B?L1VrbDZvdlpoczhCY2lPUVZVNnpncFhSZ0FvbEVvSkVaNjhsbTBSNXNhMDdn?=
 =?utf-8?B?SmVMZE1kSExvamtMVHFBV3l4Y3F6eGNITDdxZmxEWlY2RDdYL09WWHZTdklH?=
 =?utf-8?B?NDlZM2ZnblBWWjBBNzN1MFdaQ2duY2RzUUVjWEIyYzM3eTBoV2kyYTBlZkQ2?=
 =?utf-8?B?Q2VGVXRSWk5VVkdWeUZ1dEJ1T2JoL2krOUg0SytjK29JM3pOZVNuS0Z6UmY4?=
 =?utf-8?B?Vm96TnNuS0NxUEJ6Zjh5UHZwWitTK2NiVk5SV2wzYU95YkVLQ1k3N2tyQldF?=
 =?utf-8?B?dXBhb29NNFdQYUZEcFc5Z1BwL2FTME1RRTZWd3Y5SWs0ZUNrWjdGL3gxUjJm?=
 =?utf-8?B?T1NvbjJES2h3TkNjakZCUWxFR041MC9XQ1V0UnRRUGwydU5uY1lKN3FNUUJ1?=
 =?utf-8?Q?KZW7jEqYnjF55DFXeQ1evJbgQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f092e2-9c81-486a-d541-08db552daffc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 10:18:11.9021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJJIBlw8YPTccjsDG3AYHlkF0bT+gr5WMz37qt7jLEkuB3i1p0uGytkcYrYjo0jO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [RFC PATCH v2 1/7] clk: zynq: Move soc_clk_dump
 to Zynq clock driver
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



On 5/3/23 22:37, Igor Prusov wrote:
> Move clock dump function in preparation for switching to dump function
> in clk_ops.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>   arch/arm/mach-zynq/clk.c | 57 ---------------------------------------
>   drivers/clk/clk_zynq.c   | 58 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/arm/mach-zynq/clk.c b/arch/arm/mach-zynq/clk.c
> index 1945f60e08..e6a67326dd 100644
> --- a/arch/arm/mach-zynq/clk.c
> +++ b/arch/arm/mach-zynq/clk.c
> @@ -13,20 +13,6 @@
>   
>   DECLARE_GLOBAL_DATA_PTR;
>   
> -static const char * const clk_names[clk_max] = {
> -	"armpll", "ddrpll", "iopll",
> -	"cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x",
> -	"ddr2x", "ddr3x", "dci",
> -	"lqspi", "smc", "pcap", "gem0", "gem1",
> -	"fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
> -	"sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1", "dma",
> -	"usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper",
> -	"sdio0_aper", "sdio1_aper", "spi0_aper", "spi1_aper",
> -	"can0_aper", "can1_aper", "i2c0_aper", "i2c1_aper",
> -	"uart0_aper", "uart1_aper", "gpio_aper", "lqspi_aper",
> -	"smc_aper", "swdt", "dbg_trc", "dbg_apb"
> -};
> -
>   /**
>    * set_cpu_clk_info() - Setup clock information
>    *
> @@ -65,46 +51,3 @@ int set_cpu_clk_info(void)
>   
>   	return 0;
>   }
> -
> -/**
> - * soc_clk_dump() - Print clock frequencies
> - * Returns zero on success
> - *
> - * Implementation for the clk dump command.
> - */
> -int soc_clk_dump(void)
> -{
> -	struct udevice *dev;
> -	int i, ret;
> -
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -		DM_DRIVER_GET(zynq_clk), &dev);
> -	if (ret)
> -		return ret;
> -
> -	printf("clk\t\tfrequency\n");
> -	for (i = 0; i < clk_max; i++) {
> -		const char *name = clk_names[i];
> -		if (name) {
> -			struct clk clk;
> -			unsigned long rate;
> -
> -			clk.id = i;
> -			ret = clk_request(dev, &clk);
> -			if (ret < 0)
> -				return ret;
> -
> -			rate = clk_get_rate(&clk);
> -
> -			clk_free(&clk);
> -
> -			if ((rate == (unsigned long)-ENOSYS) ||
> -			    (rate == (unsigned long)-ENXIO))
> -				printf("%10s%20s\n", name, "unknown");
> -			else
> -				printf("%10s%20lu\n", name, rate);
> -		}
> -	}
> -
> -	return 0;
> -}
> diff --git a/drivers/clk/clk_zynq.c b/drivers/clk/clk_zynq.c
> index e80500e382..be5226175f 100644
> --- a/drivers/clk/clk_zynq.c
> +++ b/drivers/clk/clk_zynq.c
> @@ -454,6 +454,64 @@ static int dummy_enable(struct clk *clk)
>   	return 0;
>   }
>   
> +static const char * const clk_names[clk_max] = {
> +	"armpll", "ddrpll", "iopll",
> +	"cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x",
> +	"ddr2x", "ddr3x", "dci",
> +	"lqspi", "smc", "pcap", "gem0", "gem1",
> +	"fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
> +	"sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1", "dma",
> +	"usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper",
> +	"sdio0_aper", "sdio1_aper", "spi0_aper", "spi1_aper",
> +	"can0_aper", "can1_aper", "i2c0_aper", "i2c1_aper",
> +	"uart0_aper", "uart1_aper", "gpio_aper", "lqspi_aper",
> +	"smc_aper", "swdt", "dbg_trc", "dbg_apb"
> +};
> +
> +/**
> + * soc_clk_dump() - Print clock frequencies
> + * Returns zero on success
> + *
> + * Implementation for the clk dump command.
> + */
> +int soc_clk_dump(void)
> +{
> +	struct udevice *dev;
> +	int i, ret;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_CLK,
> +					  DM_DRIVER_GET(zynq_clk), &dev);
> +	if (ret)
> +		return ret;
> +
> +	printf("clk\t\tfrequency\n");
> +	for (i = 0; i < clk_max; i++) {
> +		const char *name = clk_names[i];
> +
> +		if (name) {
> +			struct clk clk;
> +			unsigned long rate;
> +
> +			clk.id = i;
> +			ret = clk_request(dev, &clk);
> +			if (ret < 0)
> +				return ret;
> +
> +			rate = clk_get_rate(&clk);
> +
> +			clk_free(&clk);
> +
> +			if ((rate == (unsigned long)-ENOSYS) ||
> +			    (rate == (unsigned long)-ENXIO))
> +				printf("%10s%20s\n", name, "unknown");
> +			else
> +				printf("%10s%20lu\n", name, rate);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static struct clk_ops zynq_clk_ops = {
>   	.get_rate = zynq_clk_get_rate,
>   #ifndef CONFIG_SPL_BUILD

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
