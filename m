Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38526AD1A2A
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 11:00:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01EF7C3F93A;
	Mon,  9 Jun 2025 09:00:01 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D762C3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 09:00:00 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5597m2Ji025293;
 Mon, 9 Jun 2025 10:59:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NTo6gZRQdGCMj5HkDqoUHsvm4U5cblf7AVVxJmaGmr0=; b=3gjzACo8Vl79UfTm
 EVgb/RyMVlUrH/D6x1sbHfs5GGzBETjX+QyS4IFLbMOhTgGPM98+Prfp4nFhpthR
 aG6GWB+Ql5eyVjBiEZYkmL08s0pxSmz4CDrWmO+cZ8ryEBN+El6j6Pc8QtsiwIou
 VNGNsjXf6+vl3VlotY5z7FwCVbqBSeG+YWbamyviUiPdNQSVMf53cPj7TEwhKH6M
 /OyAISGfjL6A+X4FdYFUTGoCxLbfWSuY4yzzbw5q8MMuLY47BScGEOcH7W1unJeL
 XNdEp3HTUqDhZJyqv2df3POVofT7Ctn9epOCQdtBuoV5u4dZFQUzlIdCMs+Kwxd0
 UsY3Gw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cnku4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 10:59:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 527BD40057;
 Mon,  9 Jun 2025 10:58:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51640B64492;
 Mon,  9 Jun 2025 10:57:22 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 10:57:21 +0200
Message-ID: <0c9174c3-fc9f-48e0-9a8f-f53c44a91cf6@foss.st.com>
Date: Mon, 9 Jun 2025 10:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512171016.149233-1-marek.vasut@mailbox.org>
 <02f308bf-032a-4e97-a8dc-3a1169b75c71@foss.st.com>
Content-Language: en-US
In-Reply-To: <02f308bf-032a-4e97-a8dc-3a1169b75c71@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
Cc: Julien Masson <jmasson@baylibre.com>, Tom Rini <trini@konsulko.com>,
 Raymond Mao <raymond.mao@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Paul HENRYS <paul.henrys_ext@softathome.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] tools: stm32image: Add support for STM32
	Image V2.0
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



On 5/27/25 17:59, Patrice CHOTARD wrote:
> 
> 
> On 5/12/25 19:09, Marek Vasut wrote:
>> Add support for generating STM32 Image V2.0, which is used by STM32MP13xx.
>> The image header layout is similar to STM32MP15xx STM32 Image V1.0, but is
>> different enough to justify duplicate functions to generate the v2 image.
>> This code at least attempts to align the V1 and V2 image handling where
>> possible.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot-stm32/next

Thanks
Patrice

> 
> Thanks
> Patrice
> 
>> ---
>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>> Cc: Julien Masson <jmasson@baylibre.com>
>> Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Paul HENRYS <paul.henrys_ext@softathome.com>
>> Cc: Raymond Mao <raymond.mao@linaro.org>
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  boot/image.c       |   1 +
>>  include/image.h    |   1 +
>>  tools/stm32image.c | 215 +++++++++++++++++++++++++++++++++------------
>>  3 files changed, 163 insertions(+), 54 deletions(-)
>>
>> diff --git a/boot/image.c b/boot/image.c
>> index 139c5bd035a..abac2c7034b 100644
>> --- a/boot/image.c
>> +++ b/boot/image.c
>> @@ -184,6 +184,7 @@ static const table_entry_t uimage_type[] = {
>>  	{	IH_TYPE_RENESAS_SPKG, "spkgimage", "Renesas SPKG Image" },
>>  	{	IH_TYPE_STARFIVE_SPL, "sfspl", "StarFive SPL Image" },
>>  	{	IH_TYPE_TFA_BL31, "tfa-bl31",  "TFA BL31 Image", },
>> +	{	IH_TYPE_STM32IMAGE_V2, "stm32imagev2", "STMicroelectronics STM32 Image V2.0" },
>>  	{	-1,		    "",		  "",			},
>>  };
>>  
>> diff --git a/include/image.h b/include/image.h
>> index f09862b636f..37506c81cdb 100644
>> --- a/include/image.h
>> +++ b/include/image.h
>> @@ -233,6 +233,7 @@ enum image_type_t {
>>  	IH_TYPE_RENESAS_SPKG,		/* Renesas SPKG image */
>>  	IH_TYPE_STARFIVE_SPL,		/* StarFive SPL image */
>>  	IH_TYPE_TFA_BL31,		/* TFA BL31 image */
>> +	IH_TYPE_STM32IMAGE_V2,		/* STMicroelectronics STM32 Image V2.0 */
>>  
>>  	IH_TYPE_COUNT,			/* Number of image types */
>>  };
>> diff --git a/tools/stm32image.c b/tools/stm32image.c
>> index 5c6991f35de..3cc80651fa9 100644
>> --- a/tools/stm32image.c
>> +++ b/tools/stm32image.c
>> @@ -8,58 +8,74 @@
>>  
>>  /* magic ='S' 'T' 'M' 0x32 */
>>  #define HEADER_MAGIC be32_to_cpu(0x53544D32)
>> -#define VER_MAJOR_IDX	2
>> -#define VER_MINOR_IDX	1
>> -#define VER_VARIANT_IDX	0
>> +#define VER_MAJOR	2
>> +#define VER_MINOR	1
>> +#define VER_VARIANT	0
>>  #define HEADER_VERSION_V1	0x1
>> +#define HEADER_VERSION_V2	0x2
>>  /* default option : bit0 => no signature */
>>  #define HEADER_DEFAULT_OPTION	(cpu_to_le32(0x00000001))
>>  /* default binary type for U-Boot */
>>  #define HEADER_TYPE_UBOOT	(cpu_to_le32(0x00000000))
>> +#define PADDING_HEADER_MAGIC	(cpu_to_le32(0xFFFF5453))
>> +#define PADDING_HEADER_FLAG	(1ULL << 31)
>> +#define PADDING_HEADER_LENGTH	0x180
>>  
>> -struct stm32_header {
>> +struct stm32_header_v1 {
>>  	uint32_t magic_number;
>> -	uint32_t image_signature[64 / 4];
>> +	uint8_t image_signature[64];
>>  	uint32_t image_checksum;
>> -	uint8_t  header_version[4];
>> +	uint8_t header_version[4];
>>  	uint32_t image_length;
>>  	uint32_t image_entry_point;
>>  	uint32_t reserved1;
>>  	uint32_t load_address;
>>  	uint32_t reserved2;
>>  	uint32_t version_number;
>> +	/* V1.0 specific content */
>>  	uint32_t option_flags;
>>  	uint32_t ecdsa_algorithm;
>> -	uint32_t ecdsa_public_key[64 / 4];
>> -	uint32_t padding[83 / 4];
>> -	uint32_t binary_type;
>> +	uint8_t ecdsa_public_key[64];
>> +	uint8_t padding[83];
>> +	uint8_t binary_type;
>>  };
>>  
>> -static struct stm32_header stm32image_header;
>> +struct stm32_header_v2 {
>> +	uint32_t magic_number;
>> +	uint8_t image_signature[64];
>> +	uint32_t image_checksum;
>> +	uint8_t header_version[4];
>> +	uint32_t image_length;
>> +	uint32_t image_entry_point;
>> +	uint32_t reserved1;
>> +	uint32_t load_address;
>> +	uint32_t reserved2;
>> +	uint32_t version_number;
>> +	/* V2.0 specific content */
>> +	uint32_t extension_flags;
>> +	uint32_t extension_headers_length;
>> +	uint32_t binary_type;
>> +	uint8_t padding[16];
>> +	uint32_t extension_header_type;
>> +	uint32_t extension_header_length;
>> +	uint8_t extension_padding[376];
>> +};
>>  
>> -static void stm32image_default_header(struct stm32_header *ptr)
>> -{
>> -	if (!ptr)
>> -		return;
>> -
>> -	ptr->magic_number = HEADER_MAGIC;
>> -	ptr->header_version[VER_MAJOR_IDX] = HEADER_VERSION_V1;
>> -	ptr->option_flags = HEADER_DEFAULT_OPTION;
>> -	ptr->ecdsa_algorithm = cpu_to_le32(1);
>> -	ptr->binary_type = HEADER_TYPE_UBOOT;
>> -}
>> +static struct stm32_header_v1 stm32image_header_v1;
>> +static struct stm32_header_v2 stm32image_header_v2;
>>  
>> -static uint32_t stm32image_checksum(void *start, uint32_t len)
>> +static uint32_t stm32image_checksum(void *start, uint32_t len,
>> +				    uint32_t header_size)
>>  {
>>  	uint32_t csum = 0;
>> -	uint32_t hdr_len = sizeof(struct stm32_header);
>>  	uint8_t *p;
>>  
>> -	if (len < hdr_len)
>> +	if (len < header_size) {
>>  		return 0;
>> +	}
>>  
>> -	p = start + hdr_len;
>> -	len -= hdr_len;
>> +	p = (unsigned char *)start + header_size;
>> +	len -= header_size;
>>  
>>  	while (len > 0) {
>>  		csum += *p;
>> @@ -70,24 +86,53 @@ static uint32_t stm32image_checksum(void *start, uint32_t len)
>>  	return csum;
>>  }
>>  
>> -static int stm32image_check_image_types(uint8_t type)
>> +static int stm32image_check_image_types_v1(uint8_t type)
>>  {
>>  	if (type == IH_TYPE_STM32IMAGE)
>>  		return EXIT_SUCCESS;
>>  	return EXIT_FAILURE;
>>  }
>>  
>> -static int stm32image_verify_header(unsigned char *ptr, int image_size,
>> -				    struct image_tool_params *params)
>> +static int stm32image_check_image_types_v2(uint8_t type)
>> +{
>> +	if (type == IH_TYPE_STM32IMAGE_V2)
>> +		return EXIT_SUCCESS;
>> +	return EXIT_FAILURE;
>> +}
>> +
>> +static int stm32image_verify_header_v1(unsigned char *ptr, int image_size,
>> +				       struct image_tool_params *params)
>> +{
>> +	struct stm32_header_v1 *stm32hdr = (struct stm32_header_v1 *)ptr;
>> +	int i;
>> +
>> +	if (image_size < sizeof(struct stm32_header_v1))
>> +		return -1;
>> +	if (stm32hdr->magic_number != HEADER_MAGIC)
>> +		return -1;
>> +	if (stm32hdr->header_version[VER_MAJOR] != HEADER_VERSION_V1)
>> +		return -1;
>> +	if (stm32hdr->reserved1 || stm32hdr->reserved2)
>> +		return -1;
>> +	for (i = 0; i < (sizeof(stm32hdr->padding) / 4); i++) {
>> +		if (stm32hdr->padding[i] != 0)
>> +			return -1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32image_verify_header_v2(unsigned char *ptr, int image_size,
>> +				       struct image_tool_params *params)
>>  {
>> -	struct stm32_header *stm32hdr = (struct stm32_header *)ptr;
>> +	struct stm32_header_v2 *stm32hdr = (struct stm32_header_v2 *)ptr;
>>  	int i;
>>  
>> -	if (image_size < sizeof(struct stm32_header))
>> +	if (image_size < sizeof(struct stm32_header_v2))
>>  		return -1;
>>  	if (stm32hdr->magic_number != HEADER_MAGIC)
>>  		return -1;
>> -	if (stm32hdr->header_version[VER_MAJOR_IDX] != HEADER_VERSION_V1)
>> +	if (stm32hdr->header_version[VER_MAJOR] != HEADER_VERSION_V2)
>>  		return -1;
>>  	if (stm32hdr->reserved1 || stm32hdr->reserved2)
>>  		return -1;
>> @@ -101,38 +146,85 @@ static int stm32image_verify_header(unsigned char *ptr, int image_size,
>>  
>>  static void stm32image_print_header(const void *ptr, struct image_tool_params *params)
>>  {
>> -	struct stm32_header *stm32hdr = (struct stm32_header *)ptr;
>> +	struct stm32_header_v1 *stm32hdr_v1 = (struct stm32_header_v1 *)ptr;
>> +	struct stm32_header_v2 *stm32hdr_v2 = (struct stm32_header_v2 *)ptr;
>>  
>>  	printf("Image Type   : STMicroelectronics STM32 V%d.%d\n",
>> -	       stm32hdr->header_version[VER_MAJOR_IDX],
>> -	       stm32hdr->header_version[VER_MINOR_IDX]);
>> +	       stm32hdr_v1->header_version[VER_MAJOR],
>> +	       stm32hdr_v1->header_version[VER_MINOR]);
>>  	printf("Image Size   : %lu bytes\n",
>> -	       (unsigned long)le32_to_cpu(stm32hdr->image_length));
>> +	       (unsigned long)le32_to_cpu(stm32hdr_v1->image_length));
>>  	printf("Image Load   : 0x%08x\n",
>> -	       le32_to_cpu(stm32hdr->load_address));
>> +	       le32_to_cpu(stm32hdr_v1->load_address));
>>  	printf("Entry Point  : 0x%08x\n",
>> -	       le32_to_cpu(stm32hdr->image_entry_point));
>> +	       le32_to_cpu(stm32hdr_v1->image_entry_point));
>>  	printf("Checksum     : 0x%08x\n",
>> -	       le32_to_cpu(stm32hdr->image_checksum));
>> -	printf("Option     : 0x%08x\n",
>> -	       le32_to_cpu(stm32hdr->option_flags));
>> -	printf("BinaryType : 0x%08x\n",
>> -	       le32_to_cpu(stm32hdr->binary_type));
>> +	       le32_to_cpu(stm32hdr_v1->image_checksum));
>> +	switch (stm32hdr_v1->header_version[VER_MAJOR]) {
>> +	case HEADER_VERSION_V1:
>> +		printf("Option     : 0x%08x\n",
>> +		       __le32_to_cpu(stm32hdr_v1->option_flags));
>> +		printf("BinaryType : 0x%08x\n",
>> +		       le32_to_cpu(stm32hdr_v1->binary_type));
>> +		break;
>> +
>> +	case HEADER_VERSION_V2:
>> +		printf("Extension    : 0x%08x\n",
>> +		       __le32_to_cpu(stm32hdr_v2->extension_flags));
>> +		break;
>> +
>> +	default:
>> +		printf("Incorrect header version\n");
>> +	}
>>  }
>>  
>> -static void stm32image_set_header(void *ptr, struct stat *sbuf, int ifd,
>> -				  struct image_tool_params *params)
>> +static void stm32image_set_header_v1(void *ptr, struct stat *sbuf, int ifd,
>> +				     struct image_tool_params *params)
>>  {
>> -	struct stm32_header *stm32hdr = (struct stm32_header *)ptr;
>> +	struct stm32_header_v1 *stm32hdr = (struct stm32_header_v1 *)ptr;
>>  
>> -	stm32image_default_header(stm32hdr);
>> +	stm32hdr->magic_number = HEADER_MAGIC;
>> +	stm32hdr->version_number = cpu_to_le32(0);
>> +
>> +	stm32hdr->header_version[VER_MAJOR] = HEADER_VERSION_V1;
>> +	stm32hdr->option_flags = HEADER_DEFAULT_OPTION;
>> +	stm32hdr->ecdsa_algorithm = cpu_to_le32(1);
>> +	stm32hdr->binary_type = HEADER_TYPE_UBOOT;
>>  
>>  	stm32hdr->load_address = cpu_to_le32(params->addr);
>>  	stm32hdr->image_entry_point = cpu_to_le32(params->ep);
>>  	stm32hdr->image_length = cpu_to_le32((uint32_t)sbuf->st_size -
>> -					     sizeof(struct stm32_header));
>> +					     sizeof(*stm32hdr));
>>  	stm32hdr->image_checksum =
>> -		cpu_to_le32(stm32image_checksum(ptr, sbuf->st_size));
>> +		cpu_to_le32(stm32image_checksum(ptr, sbuf->st_size,
>> +						sizeof(*stm32hdr)));
>> +}
>> +
>> +static void stm32image_set_header_v2(void *ptr, struct stat *sbuf, int ifd,
>> +				     struct image_tool_params *params)
>> +{
>> +	struct stm32_header_v2 *stm32hdr = (struct stm32_header_v2 *)ptr;
>> +
>> +	stm32hdr->magic_number = HEADER_MAGIC;
>> +	stm32hdr->version_number = cpu_to_le32(0);
>> +
>> +	stm32hdr->header_version[VER_MAJOR] = HEADER_VERSION_V2;
>> +	stm32hdr->extension_flags =
>> +		cpu_to_le32(PADDING_HEADER_FLAG);
>> +	stm32hdr->extension_headers_length =
>> +		cpu_to_le32(PADDING_HEADER_LENGTH);
>> +	stm32hdr->extension_header_type =
>> +		cpu_to_le32(PADDING_HEADER_MAGIC);
>> +	stm32hdr->extension_header_length =
>> +		cpu_to_le32(PADDING_HEADER_LENGTH);
>> +
>> +	stm32hdr->load_address = cpu_to_le32(params->addr);
>> +	stm32hdr->image_entry_point = cpu_to_le32(params->ep);
>> +	stm32hdr->image_length = cpu_to_le32((uint32_t)sbuf->st_size -
>> +					     sizeof(*stm32hdr));
>> +	stm32hdr->image_checksum =
>> +		cpu_to_le32(stm32image_checksum(ptr, sbuf->st_size,
>> +						sizeof(*stm32hdr)));
>>  }
>>  
>>  /*
>> @@ -141,14 +233,29 @@ static void stm32image_set_header(void *ptr, struct stat *sbuf, int ifd,
>>  U_BOOT_IMAGE_TYPE(
>>  	stm32image,
>>  	"STMicroelectronics STM32MP Image support",
>> -	sizeof(struct stm32_header),
>> -	(void *)&stm32image_header,
>> +	sizeof(struct stm32_header_v1),
>> +	(void *)&stm32image_header_v1,
>> +	NULL,
>> +	stm32image_verify_header_v1,
>> +	stm32image_print_header,
>> +	stm32image_set_header_v1,
>> +	NULL,
>> +	stm32image_check_image_types_v1,
>> +	NULL,
>> +	NULL
>> +);
>> +
>> +U_BOOT_IMAGE_TYPE(
>> +	stm32imagev2,
>> +	"STMicroelectronics STM32MP Image V2.0 support",
>> +	sizeof(struct stm32_header_v2),
>> +	(void *)&stm32image_header_v2,
>>  	NULL,
>> -	stm32image_verify_header,
>> +	stm32image_verify_header_v2,
>>  	stm32image_print_header,
>> -	stm32image_set_header,
>> +	stm32image_set_header_v2,
>>  	NULL,
>> -	stm32image_check_image_types,
>> +	stm32image_check_image_types_v2,
>>  	NULL,
>>  	NULL
>>  );
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
