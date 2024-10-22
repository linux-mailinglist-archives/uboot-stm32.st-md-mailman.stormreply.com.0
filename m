Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5DB9AE522
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20FAEC78F6D;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1AE1C78033
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 21:07:11 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XY4W32vMpz9tG5;
 Tue, 22 Oct 2024 23:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1AxsLGDFNNf1dc8oykx7BND00NhAWNBQ5xeYXHLZlQ=;
 b=JnUMDR1lv7ilz3iEJ+g+7QaFW3yltTSQgQpWeVqbhw/jBiUWNybVU0faPcuI5U9eOQQ5FW
 Pk83zV6YrwQAc47RWhJ2VlNfqd383IXtPAms+j13lAETSyZhYMPI8giFVDGwuN5rxlVcs+
 8G/Ju62+EN6KTzjwfGkC5lLSvN9p341Q6XTRvUmO0vW9XyifzHbDZMHOUT6mRXTFdsSLDz
 7XqPREOilE+72fPOztY/RXd7FosmJXzpqvTcSgzcejR0q0Wb4+lY84snWTH00UuBAJEZZt
 lGS+N6NZ9y/f2TFQ5M6+am7IfpvtyKzc4oDXDQz9/xt7a0e8pNKf6by2/C2Fyw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1AxsLGDFNNf1dc8oykx7BND00NhAWNBQ5xeYXHLZlQ=;
 b=uyATcM+XGR0EQ4YqdZiCpG3Q3lkrAN4sx7fQ8bwXWi/bgBFS2fYTRRCEUrNOiL6U4ovKXz
 Hl1gF7WSBNMWViIFN1QRC2GkGc8aJe4qdV4xS70dc8dvQ7YW1cl8aPZg2Z/yyXwvm+bYVq
 Z4nr0eqRNxSFtd9gqykUd7bILD0P93RFsuowoJImdfkCAyf7JziBFEp1PRFRlJ2/WN91R+
 hFVquub30C8CIpwOC7zRU6gzqHyFWV8cqgfrmmVCHKnRAQNZcsnz0FqPFcL94gsh3+YECn
 QntGexq40LbagHbgCUUtF/MeH194hoUwsRzAn5wXjYYgA5KT/McmLOrf6jpC8Q==
To: u-boot@lists.denx.de
Date: Tue, 22 Oct 2024 23:06:21 +0200
Message-ID: <20241022210633.271534-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: ic7opt4fyynn1a6qg6ooruiqr8hfoyhc
X-MBO-RS-ID: bfb8576876f20b82272
X-Rspamd-Queue-Id: 4XY4W32vMpz9tG5
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:40:30 +0000
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [Uboot-stm32] [PATCH 6/6] Revert "mtd: spi-nor: Add parallel and
	stacked memories support"
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

This reverts commit 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Pratyush Yadav <p.yadav@ti.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/mtd/spi/spi-nor-core.c | 301 ++++-----------------------------
 drivers/spi/Kconfig            |   6 -
 include/linux/mtd/spi-nor.h    |  17 --
 include/spi.h                  |  11 --
 4 files changed, 34 insertions(+), 301 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 25fb034dcae..85d12d58907 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -696,17 +696,12 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 				      const struct flash_info *info)
 {
-	bool shift = 0;
-
-	if (nor->flags & SNOR_F_HAS_PARALLEL)
-		shift = 1;
-
 	/* Do some manufacturer fixups first */
 	switch (JEDEC_MFR(info)) {
 	case SNOR_MFR_SPANSION:
 		/* No small sector erase for 4-byte command set */
 		nor->erase_opcode = SPINOR_OP_SE;
-		nor->mtd.erasesize = info->sector_size << shift;
+		nor->mtd.erasesize = info->sector_size;
 		break;
 
 	default:
@@ -1041,8 +1036,8 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 addr, len, rem, offset, max_size;
 	bool addr_known = false;
+	u32 addr, len, rem, max_size;
 	int ret, err;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
@@ -1068,18 +1063,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			ret = -EINTR;
 			goto erase_err;
 		}
-		offset = addr;
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			offset /= 2;
-
-		if (nor->flags & SNOR_F_HAS_STACKED) {
-			if (offset >= (mtd->size / 2)) {
-				offset = offset - (mtd->size / 2);
-				nor->spi->flags |= SPI_XFER_U_PAGE;
-			} else {
-				nor->spi->flags &= ~SPI_XFER_U_PAGE;
-			}
-		}
 #ifdef CONFIG_SPI_FLASH_BAR
 		ret = write_bar(nor, addr);
 		if (ret < 0)
@@ -1491,9 +1474,6 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 	u8			id[SPI_NOR_MAX_ID_LEN];
 	const struct flash_info	*info;
 
-	if (nor->flags & SNOR_F_HAS_PARALLEL)
-		nor->spi->flags |= SPI_XFER_LOWER;
-
 	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
 	if (tmp < 0) {
 		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", tmp);
@@ -1518,67 +1498,28 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
-	loff_t offset = from;
-	u32 read_len = 0;
-	u32 rem_bank_len = 0;
-	u8 bank;
-	bool is_ofst_odd = false;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	if ((nor->flags & SNOR_F_HAS_PARALLEL) && (offset & 1)) {
-	    /* We can hit this case when we use file system like ubifs */
-		from--;
-		len++;
-		is_ofst_odd = true;
-	}
-
 	while (len) {
-		if (nor->addr_width == 3) {
-			if (nor->flags & SNOR_F_HAS_PARALLEL) {
-				bank = (u32)from / (SZ_16M << 0x01);
-				rem_bank_len = ((SZ_16M << 0x01) *
-					(bank + 1)) - from;
-			} else {
-				bank = (u32)from / SZ_16M;
-				rem_bank_len = (SZ_16M * (bank + 1)) - from;
-			}
-		}
-		offset = from;
+		loff_t addr = from;
+		size_t read_len = len;
 
-		if (nor->flags & SNOR_F_HAS_STACKED) {
-			if (offset >= (mtd->size / 2)) {
-				offset = offset - (mtd->size / 2);
-				nor->spi->flags |= SPI_XFER_U_PAGE;
-			} else {
-				nor->spi->flags &= ~SPI_XFER_U_PAGE;
-			}
-		}
-
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			offset /= 2;
-
-		if (nor->addr_width == 3) {
 #ifdef CONFIG_SPI_FLASH_BAR
-			ret = write_bar(nor, offset);
-			if (ret < 0)
-				return log_ret(ret);
-#endif
-		}
+		u32 remain_len;
 
-		if (len < rem_bank_len)
+		ret = write_bar(nor, addr);
+		if (ret < 0)
+			return log_ret(ret);
+		remain_len = (SZ_16M * (nor->bank_curr + 1)) - addr;
+
+		if (len < remain_len)
 			read_len = len;
 		else
-			read_len = rem_bank_len;
-
-		if (read_len == 0)
-			return -EIO;
-
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			goto read_err;
+			read_len = remain_len;
+#endif
 
-		ret = nor->read(nor, offset, read_len, buf);
+		ret = nor->read(nor, addr, read_len, buf);
 		if (ret == 0) {
 			/* We shouldn't see 0-length reads */
 			ret = -EIO;
@@ -1587,15 +1528,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 		if (ret < 0)
 			goto read_err;
 
-		if (is_ofst_odd == true) {
-			memmove(buf, (buf + 1), (len - 1));
-			*retlen += (ret - 1);
-			buf += ret - 1;
-			is_ofst_odd = false;
-		} else {
-			*retlen += ret;
-			buf += ret;
-		}
+		*retlen += ret;
+		buf += ret;
 		from += ret;
 		len -= ret;
 	}
@@ -1890,7 +1824,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	size_t page_offset, page_remain, i;
 	ssize_t ret;
-	u32 offset;
 
 #ifdef CONFIG_SPI_FLASH_SST
 	/* sst nor chips use AAI word program */
@@ -1900,27 +1833,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	if (!len)
-		return 0;
-
-	/*
-	 * Cannot write to odd offset in parallel mode,
-	 * so write 2 bytes first
-	 */
-	if ((nor->flags & SNOR_F_HAS_PARALLEL) && (to & 1)) {
-		u8 two[2] = {0xff, buf[0]};
-		size_t local_retlen;
-
-		ret = spi_nor_write(mtd, to & ~1, 2, &local_retlen, two);
-		if (ret < 0)
-			return ret;
-
-		*retlen += 1; /* We've written only one actual byte */
-		++buf;
-		--len;
-		++to;
-	}
-
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
@@ -1938,35 +1850,18 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			page_offset = do_div(aux, nor->page_size);
 		}
-		offset = (to + i);
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			offset /= 2;
-
-		if (nor->flags & SNOR_F_HAS_STACKED) {
-			if (offset >= (mtd->size / 2)) {
-				offset = offset - (mtd->size / 2);
-				nor->spi->flags |= SPI_XFER_U_PAGE;
-			} else {
-				nor->spi->flags &= ~SPI_XFER_U_PAGE;
-			}
-		}
-
-		if (nor->addr_width == 3) {
-#ifdef CONFIG_SPI_FLASH_BAR
-			ret = write_bar(nor, offset);
-			if (ret < 0)
-				return ret;
-#endif
-		}
 		/* the size of data remaining on the first page */
 		page_remain = min_t(size_t,
 				    nor->page_size - page_offset, len - i);
 
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			goto write_err;
+#ifdef CONFIG_SPI_FLASH_BAR
+		ret = write_bar(nor, addr);
+		if (ret < 0)
+			return ret;
+#endif
 
 		write_enable(nor);
+
 		/*
 		 * On DTR capable flashes like Micron Xcella the writes cannot
 		 * start or end at an odd address in DTR mode. So we need to
@@ -1974,7 +1869,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		 * address and end address are even.
 		 */
 		if (spi_nor_protocol_is_dtr(nor->write_proto) &&
-		    ((offset | page_remain) & 1)) {
+		    ((addr | page_remain) & 1)) {
 			u_char *tmp;
 			size_t extra_bytes = 0;
 
@@ -1985,10 +1880,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			}
 
 			/* Prepend a 0xff byte if the start address is odd. */
-			if (offset & 1) {
+			if (addr & 1) {
 				tmp[0] = 0xff;
 				memcpy(tmp + 1, buf + i, page_remain);
-				offset--;
+				addr--;
 				page_remain++;
 				extra_bytes++;
 			} else {
@@ -1996,13 +1891,13 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			}
 
 			/* Append a 0xff byte if the end address is odd. */
-			if ((offset + page_remain) & 1) {
+			if ((addr + page_remain) & 1) {
 				tmp[page_remain + extra_bytes] = 0xff;
 				extra_bytes++;
 				page_remain++;
 			}
 
-			ret = nor->write(nor, offset, page_remain, tmp);
+			ret = nor->write(nor, addr, page_remain, tmp);
 
 			kfree(tmp);
 
@@ -2015,7 +1910,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			 */
 			written = ret - extra_bytes;
 		} else {
-			ret = nor->write(nor, offset, page_remain, buf + i);
+			ret = nor->write(nor, addr, page_remain, buf + i);
 			if (ret < 0)
 				goto write_err;
 			written = ret;
@@ -2024,11 +1919,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto write_err;
-
-		ret = write_disable(nor);
-		if (ret)
-			goto write_err;
-
 		*retlen += written;
 		i += written;
 	}
@@ -2069,10 +1959,6 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	ret = write_disable(nor);
-	if (ret)
-		return ret;
-
 	ret = read_sr(nor);
 	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
 		dev_err(nor->dev, "Macronix Quad bit not set\n");
@@ -2134,7 +2020,7 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u32 addr_base,
 		return -EINVAL;
 	}
 
-	return write_disable(nor);
+	return 0;
 }
 #endif
 
@@ -2310,10 +2196,6 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 	nor->read_dummy = 8;
 
 	while (len) {
-		/* Both chips are identical, so should be the SFDP data */
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			nor->spi->flags |= SPI_XFER_LOWER;
-
 		ret = nor->read(nor, addr, len, (u8 *)buf);
 		if (!ret || ret > len) {
 			ret = -EIO;
@@ -3008,13 +2890,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
 {
-#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_ADVANCE)
-	struct udevice *dev = nor->spi->dev;
-	u64 flash_size[SNOR_FLASH_CNT_MAX] = {0};
-	u32 idx = 0, i = 0;
-	int rc;
-#endif
-
 	/* Set legacy flash parameters as default. */
 	memset(params, 0, sizeof(*params));
 
@@ -3133,63 +3008,8 @@ static int spi_nor_init_params(struct spi_nor *nor,
 
 		spi_nor_post_sfdp_fixups(nor, params);
 	}
-#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_ADVANCE)
-	/*
-	 * The flashes that are connected in stacked mode should be of same make.
-	 * Except the flash size all other properties are identical for all the
-	 * flashes connected in stacked mode.
-	 * The flashes that are connected in parallel mode should be identical.
-	 */
-	while (i < SNOR_FLASH_CNT_MAX) {
-		rc = ofnode_read_u64_index(dev_ofnode(dev), "stacked-memories",
-					   idx, &flash_size[i]);
-		if (rc == -EINVAL) {
-			break;
-		} else if (rc == -EOVERFLOW) {
-			idx++;
-		} else {
-			idx++;
-			i++;
-			if (!(nor->flags & SNOR_F_HAS_STACKED))
-				nor->flags |= SNOR_F_HAS_STACKED;
-			if (!(nor->spi->flags & SPI_XFER_STACKED))
-				nor->spi->flags |= SPI_XFER_STACKED;
-		}
-	}
-
-	i = 0;
-	idx = 0;
-	while (i < SNOR_FLASH_CNT_MAX) {
-		rc = ofnode_read_u64_index(dev_ofnode(dev), "parallel-memories",
-					   idx, &flash_size[i]);
-		if (rc == -EINVAL) {
-			break;
-		} else if (rc == -EOVERFLOW) {
-			idx++;
-		} else {
-			idx++;
-			i++;
-			if (!(nor->flags & SNOR_F_HAS_PARALLEL))
-				nor->flags |= SNOR_F_HAS_PARALLEL;
-		}
-	}
 
-	if (nor->flags & (SNOR_F_HAS_STACKED | SNOR_F_HAS_PARALLEL)) {
-		params->size = 0;
-		for (idx = 0; idx < SNOR_FLASH_CNT_MAX; idx++)
-			params->size += flash_size[idx];
-	}
-	/*
-	 * In parallel-memories the erase operation is
-	 * performed on both the flashes simultaneously
-	 * so, double the erasesize.
-	 */
-	if (nor->flags & SNOR_F_HAS_PARALLEL) {
-		nor->mtd.erasesize <<= 1;
-		params->page_size <<= 1;
-	}
-#endif
-	spi_nor_late_init_fixups(nor, params);
+	spi_nor_post_sfdp_fixups(nor, params);
 
 	return 0;
 }
@@ -3503,54 +3323,16 @@ static int spi_nor_select_erase(struct spi_nor *nor,
 	/* prefer "small sector" erase if possible */
 	if (info->flags & SECT_4K) {
 		nor->erase_opcode = SPINOR_OP_BE_4K;
-		/*
-		 * In parallel-memories the erase operation is
-		 * performed on both the flashes simultaneously
-		 * so, double the erasesize.
-		 */
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			mtd->erasesize = 4096 * 2;
-		else
-			mtd->erasesize = 4096;
+		mtd->erasesize = 4096;
 	} else if (info->flags & SECT_4K_PMC) {
 		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
-		/*
-		 * In parallel-memories the erase operation is
-		 * performed on both the flashes simultaneously
-		 * so, double the erasesize.
-		 */
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			mtd->erasesize = 4096 * 2;
-		else
-			mtd->erasesize = 4096;
+		mtd->erasesize = 4096;
 	} else
 #endif
 	{
 		nor->erase_opcode = SPINOR_OP_SE;
-		/*
-		 * In parallel-memories the erase operation is
-		 * performed on both the flashes simultaneously
-		 * so, double the erasesize.
-		 */
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			mtd->erasesize = info->sector_size * 2;
-		else
-			mtd->erasesize = info->sector_size;
-	}
-
-	if ((JEDEC_MFR(info) == SNOR_MFR_SST) && info->flags & SECT_4K) {
-		nor->erase_opcode = SPINOR_OP_BE_4K;
-		/*
-		 * In parallel-memories the erase operation is
-		 * performed on both the flashes simultaneously
-		 * so, double the erasesize.
-		 */
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			mtd->erasesize = 4096 * 2;
-		else
-			mtd->erasesize = 4096;
+		mtd->erasesize = info->sector_size;
 	}
-
 	return 0;
 }
 
@@ -4206,9 +3988,6 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
-	if (nor->flags & SNOR_F_HAS_PARALLEL)
-		nor->spi->flags |= SPI_NOR_ENABLE_MULTI_CS;
-
 	err = spi_nor_octal_dtr_enable(nor);
 	if (err) {
 		dev_dbg(nor->dev, "Octal DTR mode not supported\n");
@@ -4395,7 +4174,6 @@ int spi_nor_scan(struct spi_nor *nor)
 	struct spi_slave *spi = nor->spi;
 	int ret;
 	int cfi_mtd_nb = 0;
-	bool shift = 0;
 
 #ifdef CONFIG_FLASH_CFI_MTD
 	cfi_mtd_nb = CFI_FLASH_BANKS;
@@ -4533,9 +4311,7 @@ int spi_nor_scan(struct spi_nor *nor)
 		nor->addr_width = 3;
 	}
 
-	if (nor->flags & (SNOR_F_HAS_PARALLEL | SNOR_F_HAS_STACKED))
-		shift = 1;
-	if (nor->addr_width == 3 && (mtd->size >> shift) > SZ_16M) {
+	if (nor->addr_width == 3 && mtd->size > SZ_16M) {
 #ifndef CONFIG_SPI_FLASH_BAR
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
@@ -4545,7 +4321,6 @@ int spi_nor_scan(struct spi_nor *nor)
 #else
 	/* Configure the BAR - discover bank cmds and read current bank */
 	nor->addr_width = 3;
-	set_4byte(nor, info, 0);
 	ret = read_bar(nor, info);
 	if (ret < 0)
 		return ret;
@@ -4563,14 +4338,6 @@ int spi_nor_scan(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->flags & SNOR_F_HAS_STACKED) {
-		nor->spi->flags |= SPI_XFER_U_PAGE;
-		ret = spi_nor_init(nor);
-		if (ret)
-			return ret;
-		nor->spi->flags &= ~SPI_XFER_U_PAGE;
-	}
-
 	nor->rdsr_dummy = params.rdsr_dummy;
 	nor->rdsr_addr_nbytes = params.rdsr_addr_nbytes;
 	nor->name = info->name;
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index fa817ec4883..280d1f62ae9 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -20,12 +20,6 @@ menuconfig SPI
 
 if SPI
 
-config SPI_ADVANCE
-	bool "Enable the advance feature"
-	help
-	 Enable the SPI advance feature support. By default this is disabled.
-	 If you intend to use the advance feature support you should enable.
-
 config DM_SPI
 	bool "Enable Driver Model for SPI drivers"
 	depends on DM
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 655a6d197ea..651628200b7 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -13,9 +13,6 @@
 #include <linux/mtd/mtd.h>
 #include <spi-mem.h>
 
-/* In parallel configuration enable multiple CS */
-#define SPI_NOR_ENABLE_MULTI_CS	(BIT(0) | BIT(1))
-
 /*
  * Manufacturer IDs
  *
@@ -185,12 +182,6 @@
 /* Status Register 3 bits. */
 #define SR3_WPS			BIT(2)
 
-/*
- * Maximum number of flashes that can be connected
- * in stacked/parallel configuration
- */
-#define SNOR_FLASH_CNT_MAX	2
-
 /* For Cypress flash. */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
@@ -308,13 +299,6 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_SOFT_RESET	= BIT(7),
 	SNOR_F_IO_MODE_EN_VOLATILE = BIT(8),
-#if defined(CONFIG_SPI_ADVANCE)
-	SNOR_F_HAS_STACKED	= BIT(9),
-	SNOR_F_HAS_PARALLEL	= BIT(10),
-#else
-	SNOR_F_HAS_STACKED	= 0,
-	SNOR_F_HAS_PARALLEL	= 0,
-#endif
 };
 
 struct spi_nor;
@@ -573,7 +557,6 @@ struct spi_nor {
 	u8			bank_read_cmd;
 	u8			bank_write_cmd;
 	u8			bank_curr;
-	u8			upage_prev;
 #endif
 	enum spi_nor_protocol	read_proto;
 	enum spi_nor_protocol	write_proto;
diff --git a/include/spi.h b/include/spi.h
index 6e8e0cce7f2..9e9851284c8 100644
--- a/include/spi.h
+++ b/include/spi.h
@@ -38,15 +38,6 @@
 
 #define SPI_DEFAULT_WORDLEN	8
 
-/* SPI transfer flags */
-#define SPI_XFER_STRIPE	(1 << 6)
-#define SPI_XFER_MASK	(3 << 8)
-#define SPI_XFER_LOWER	(1 << 8)
-#define SPI_XFER_UPPER	(2 << 8)
-
-/* Max no. of CS supported per spi device */
-#define SPI_CS_CNT_MAX	2
-
 /**
  * struct dm_spi_bus - SPI bus info
  *
@@ -164,8 +155,6 @@ struct spi_slave {
 #define SPI_XFER_BEGIN		BIT(0)	/* Assert CS before transfer */
 #define SPI_XFER_END		BIT(1)	/* Deassert CS after transfer */
 #define SPI_XFER_ONCE		(SPI_XFER_BEGIN | SPI_XFER_END)
-#define SPI_XFER_U_PAGE		BIT(4)
-#define SPI_XFER_STACKED	BIT(5)
 };
 
 /**
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
