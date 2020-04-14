Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5A1A7BAA
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:04:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF595C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:04:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2749C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:03:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3u0k011468; Tue, 14 Apr 2020 15:03:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ShHLjpZRl0+QNPHXtbZBXkySTKGMF4bkCbdEnQTo8wU=;
 b=V/Ns/x+VsAWZ1gg1n5wcv19b3IVN8lH5k6u4F4iE2V7gAktcmoJQ/JPwbj20AjhT3UAz
 2rxs7YzevfufWcQvEwNLecNCuYb80UC+ezLD8ocd2OFKMS0BVn3uIJQ+Kc/lyhhjEqXr
 G938rIpb0sIFXwv35CVnfLUVYK1xUPND7IINei9sEOsMqen/sYUWwG0LOQdFF63YQOaL
 K6ZfZzPubTj/kk7bkexg5o9Eu2NncEMHA879igpcy2NrD1MpupnytNSWH4mHwO/JEZ9b
 KE/Qd38Vj/GzfPsLJ27HJeMAD9Inb4pETn2JTWE/8bCBVt8cPoDj1VU9IpEyrYf+EGE7 zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b668dnqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:03:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF450100039;
 Tue, 14 Apr 2020 15:03:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4A812B5C40;
 Tue, 14 Apr 2020 15:03:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 15:03:52 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:03:52 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 05/18] stm32mp: stm32prog: add flash layout parsing
Thread-Index: AQHV/P69eRUJlgaJ2UyImVZUpTLKm6h4nsMA
Date: Tue, 14 Apr 2020 13:03:52 +0000
Message-ID: <00a08d10-3d8a-4d8f-9cb7-bea3e7fe5549@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-6-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-6-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <E58E5BF5C346C243BE58E075E3FA7CD3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 05/18] stm32mp: stm32prog: add flash
	layout parsing
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

On 3/18/20 9:24 AM, Patrick Delaunay wrote:
> Build the list of device and of partition with
> a tab separated value file with a stm32 header: the FlashLayout.tsv
> (https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer_flashlayout)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 372 +++++++++++++++++-
>  1 file changed, 371 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index e2c6c43d88..11fe479072 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -24,6 +24,17 @@
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> +/* order of column in flash layout file */
> +enum stm32prog_col_t {
> +	COL_OPTION,
> +	COL_ID,
> +	COL_NAME,
> +	COL_TYPE,
> +	COL_IP,
> +	COL_OFFSET,
> +	COL_NB_STM32
> +};
> +
>  char *stm32prog_get_error(struct stm32prog_data *data)
>  {
>  	static const char error_msg[] = "Unspecified";
> @@ -34,11 +45,370 @@ char *stm32prog_get_error(struct stm32prog_data *data)
>  	return data->error;
>  }
>  
> +u8 stm32prog_header_check(struct raw_header_s *raw_header,
> +			  struct image_header_s *header)
> +{
> +	unsigned int i;
> +
> +	header->present = 0;
> +	header->image_checksum = 0x0;
> +	header->image_length = 0x0;
> +
> +	if (!raw_header || !header) {
> +		pr_debug("%s:no header data\n", __func__);
> +		return -1;
> +	}
> +	if (raw_header->magic_number !=
> +		(('S' << 0) | ('T' << 8) | ('M' << 16) | (0x32 << 24))) {
> +		pr_debug("%s:invalid magic number : 0x%x\n",
> +			 __func__, raw_header->magic_number);
> +		return -2;
> +	}
> +	/* only header v1.0 supported */
> +	if (raw_header->header_version != 0x00010000) {
> +		pr_debug("%s:invalid header version : 0x%x\n",
> +			 __func__, raw_header->header_version);
> +		return -3;
> +	}
> +	if (raw_header->reserved1 != 0x0 || raw_header->reserved2) {
> +		pr_debug("%s:invalid reserved field\n", __func__);
> +		return -4;
> +	}
> +	for (i = 0; i < (sizeof(raw_header->padding) / 4); i++) {
> +		if (raw_header->padding[i] != 0) {
> +			pr_debug("%s:invalid padding field\n", __func__);
> +			return -5;
> +		}
> +	}
> +	header->present = 1;
> +	header->image_checksum = le32_to_cpu(raw_header->image_checksum);
> +	header->image_length = le32_to_cpu(raw_header->image_length);
> +
> +	return 0;
> +}
> +
> +static u32 stm32prog_header_checksum(u32 addr, struct image_header_s *header)
> +{
> +	u32 i, checksum;
> +	u8 *payload;
> +
> +	/* compute checksum on payload */
> +	payload = (u8 *)addr;
> +	checksum = 0;
> +	for (i = header->image_length; i > 0; i--)
> +		checksum += *(payload++);
> +
> +	return checksum;
> +}
> +
> +/* FLASHLAYOUT PARSING *****************************************/
> +static int parse_option(struct stm32prog_data *data,
> +			int i, char *p, struct stm32prog_part_t *part)
> +{
> +	int result = 0;
> +	char *c = p;
> +
> +	part->option = 0;
> +	if (!strcmp(p, "-"))
> +		return 0;
> +
> +	while (*c) {
> +		switch (*c) {
> +		case 'P':
> +			part->option |= OPT_SELECT;
> +			break;
> +		case 'E':
> +			part->option |= OPT_EMPTY;
> +			break;
> +		default:
> +			result = -EINVAL;
> +			stm32prog_err("Layout line %d: invalid option '%c' in %s)",
> +				      i, *c, p);
> +			return -EINVAL;
> +		}
> +		c++;
> +	}
> +	if (!(part->option & OPT_SELECT)) {
> +		stm32prog_err("Layout line %d: missing 'P' in option %s", i, p);
> +		return -EINVAL;
> +	}
> +
> +	return result;
> +}
> +
> +static int parse_id(struct stm32prog_data *data,
> +		    int i, char *p, struct stm32prog_part_t *part)
> +{
> +	int result = 0;
> +	unsigned long value;
> +
> +	result = strict_strtoul(p, 0, &value);
> +	part->id = value;
> +	if (result || value > PHASE_LAST_USER) {
> +		stm32prog_err("Layout line %d: invalid phase value = %s", i, p);
> +		result = -EINVAL;
> +	}
> +
> +	return result;
> +}
> +
> +static int parse_name(struct stm32prog_data *data,
> +		      int i, char *p, struct stm32prog_part_t *part)
> +{
> +	int result = 0;
> +
> +	if (strlen(p) < sizeof(part->name)) {
> +		strcpy(part->name, p);
> +	} else {
> +		stm32prog_err("Layout line %d: partition name too long [%d]: %s",
> +			      i, strlen(p), p);
> +		result = -EINVAL;
> +	}
> +
> +	return result;
> +}
> +
> +static int parse_type(struct stm32prog_data *data,
> +		      int i, char *p, struct stm32prog_part_t *part)
> +{
> +	int result = 0;
> +
> +	if (!strcmp(p, "Binary")) {
> +		part->part_type = PART_BINARY;
> +	} else if (!strcmp(p, "System")) {
> +		part->part_type = PART_SYSTEM;
> +	} else if (!strcmp(p, "FileSystem")) {
> +		part->part_type = PART_FILESYSTEM;
> +	} else if (!strcmp(p, "RawImage")) {
> +		part->part_type = RAW_IMAGE;
> +	} else {
> +		result = -EINVAL;
> +	}
> +	if (result)
> +		stm32prog_err("Layout line %d: type parsing error : '%s'",
> +			      i, p);
> +
> +	return result;
> +}
> +
> +static int parse_ip(struct stm32prog_data *data,
> +		    int i, char *p, struct stm32prog_part_t *part)
> +{
> +	int result = 0;
> +	unsigned int len = 0;
> +
> +	part->dev_id = 0;
> +	if (!strcmp(p, "none")) {
> +		part->target = STM32PROG_NONE;
> +	} else {
> +		result = -EINVAL;
> +	}
> +	if (len) {
> +		/* only one digit allowed for device id */
> +		if (strlen(p) != len + 1) {
> +			result = -EINVAL;
> +		} else {
> +			part->dev_id = p[len] - '0';
> +			if (part->dev_id > 9)
> +				result = -EINVAL;
> +		}
> +	}
> +	if (result)
> +		stm32prog_err("Layout line %d: ip parsing error: '%s'", i, p);
> +
> +	return result;
> +}
> +
> +static int parse_offset(struct stm32prog_data *data,
> +			int i, char *p, struct stm32prog_part_t *part)
> +{
> +	int result = 0;
> +	char *tail;
> +
> +	part->part_id = 0;
> +	part->size = 0;
> +	part->addr = simple_strtoull(p, &tail, 0);
> +	if (tail == p || *tail != '\0') {
> +		stm32prog_err("Layout line %d: invalid offset '%s'",
> +			      i, p);
> +		result = -EINVAL;
> +	}
> +
> +	return result;
> +}
> +
> +static
> +int (* const parse[COL_NB_STM32])(struct stm32prog_data *data, int i, char *p,
> +				  struct stm32prog_part_t *part) = {
> +	[COL_OPTION] = parse_option,
> +	[COL_ID] = parse_id,
> +	[COL_NAME] =  parse_name,
> +	[COL_TYPE] = parse_type,
> +	[COL_IP] = parse_ip,
> +	[COL_OFFSET] = parse_offset,
> +};
> +
>  static int parse_flash_layout(struct stm32prog_data *data,
>  			      ulong addr,
>  			      ulong size)
>  {
> -	return -ENODEV;
> +	int column = 0, part_nb = 0, ret;
> +	bool end_of_line, eof;
> +	char *p, *start, *last, *col;
> +	struct stm32prog_part_t *part;
> +	int part_list_size;
> +	int i;
> +
> +	data->part_nb = 0;
> +
> +	/* check if STM32image is detected */
> +	if (!stm32prog_header_check((struct raw_header_s *)addr,
> +				    &data->header)) {
> +		u32 checksum;
> +
> +		addr = addr + BL_HEADER_SIZE;
> +		size = data->header.image_length;
> +
> +		checksum = stm32prog_header_checksum(addr, &data->header);
> +		if (checksum != data->header.image_checksum) {
> +			stm32prog_err("Layout: invalid checksum : 0x%x expected 0x%x",
> +				      checksum, data->header.image_checksum);
> +			return -EIO;
> +		}
> +	}
> +	if (!size)
> +		return -EINVAL;
> +
> +	start = (char *)addr;
> +	last = start + size;
> +
> +	*last = 0x0; /* force null terminated string */
> +	pr_debug("flash layout =\n%s\n", start);
> +
> +	/* calculate expected number of partitions */
> +	part_list_size = 1;
> +	p = start;
> +	while (*p && (p < last)) {
> +		if (*p++ == '\n') {
> +			part_list_size++;
> +			if (p < last && *p == '#')
> +				part_list_size--;
> +		}
> +	}
> +	if (part_list_size > PHASE_LAST_USER) {
> +		stm32prog_err("Layout: too many partition (%d)",
> +			      part_list_size);
> +		return -1;
> +	}
> +	part = calloc(sizeof(struct stm32prog_part_t), part_list_size);
> +	if (!part) {
> +		stm32prog_err("Layout: alloc failed");
> +		return -ENOMEM;
> +	}
> +	data->part_array = part;
> +
> +	/* main parsing loop */
> +	i = 1;
> +	eof = false;
> +	p = start;
> +	col = start; /* 1st column */
> +	end_of_line = false;
> +	while (!eof) {
> +		switch (*p) {
> +		/* CR is ignored and replaced by NULL character */
> +		case '\r':
> +			*p = '\0';
> +			p++;
> +			continue;
> +		case '\0':
> +			end_of_line = true;
> +			eof = true;
> +			break;
> +		case '\n':
> +			end_of_line = true;
> +			break;
> +		case '\t':
> +			break;
> +		case '#':
> +			/* comment line is skipped */
> +			if (column == 0 && p == col) {
> +				while ((p < last) && *p)
> +					if (*p++ == '\n')
> +						break;
> +				col = p;
> +				i++;
> +				if (p >= last || !*p) {
> +					eof = true;
> +					end_of_line = true;
> +				}
> +				continue;
> +			}
> +			/* fall through */
> +		/* by default continue with the next character */
> +		default:
> +			p++;
> +			continue;
> +		}
> +
> +		/* replace by \0: allow string parsing for each column */
> +		*p = '\0';
> +		p++;
> +		if (p >= last) {
> +			eof = true;
> +			end_of_line = true;
> +		}
> +
> +		/* skip empty line and multiple TAB in tsv file */
> +		if (strlen(col) == 0) {
> +			col = p;
> +			/* skip empty line */
> +			if (column == 0 && end_of_line) {
> +				end_of_line = false;
> +				i++;
> +			}
> +			continue;
> +		}
> +
> +		if (column < COL_NB_STM32) {
> +			ret = parse[column](data, i, col, part);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* save the beginning of the next column */
> +		column++;
> +		col = p;
> +
> +		if (!end_of_line)
> +			continue;
> +
> +		/* end of the line detected */
> +		end_of_line = false;
> +
> +		if (column < COL_NB_STM32) {
> +			stm32prog_err("Layout line %d: no enought column", i);
> +			return -EINVAL;
> +		}
> +		column = 0;
> +		part_nb++;
> +		part++;
> +		i++;
> +		if (part_nb >= part_list_size) {
> +			part = NULL;
> +			if (!eof) {
> +				stm32prog_err("Layout: no enought memory for %d part",
> +					      part_nb);
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +	data->part_nb = part_nb;
> +	if (data->part_nb == 0) {
> +		stm32prog_err("Layout: no partition found");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
>  }
>  
>  static int __init part_cmp(void *priv, struct list_head *a, struct list_head *b)

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
